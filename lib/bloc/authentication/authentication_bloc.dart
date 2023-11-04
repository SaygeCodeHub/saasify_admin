import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../di/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';
import 'authentication_event.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  FirebaseAuth auth = FirebaseAuth.instance;

  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SwitchAuthentication>(_switchLogin);
    on<GetOtp>(_getOtp);
    on<OtpReceivedOnPhone>(_otpReceivedOnPhone);
    on<VerifyOtp>(_onVerifyOtp);
    on<OtpVerified>(_loginWithCredential);
    on<OtpVerificationError>(_onOtpVerificationError);
    on<TextFieldChange>(_textFieldChange);
  }

  FutureOr<void> _switchLogin(
      SwitchAuthentication event, Emitter<AuthenticationStates> emit) {
    log('inside switch login');
    bool isLogin = !event.isLogin;
    emit(AuthenticationFormLoaded(isLogin: isLogin));
  }

  FutureOr<void> _textFieldChange(
      TextFieldChange event, Emitter<AuthenticationStates> emit) {
    emit(AuthenticationFormLoaded(isLogin: event.isLogin));
  }

  _otpReceivedOnPhone(
      OtpReceivedOnPhone event, Emitter<AuthenticationStates> emit) async {
    emit(OtpReceived(
        verificationId: event.verificationId, userName: event.userName));
  }

  FutureOr<void> _getOtp(
      GetOtp event, Emitter<AuthenticationStates> emit) async {
    log("here===>_getOtp");
    log("here===>${event.phoneNo}");
    log("here===>_getOtp");
    emit(OtpLoading());
    try {
      await _authenticationRepository.verifyPhoneNumber(
        phoneNumber: event.phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          add(OtpVerified(credential: credential, userName: event.userName));
          log("here===>verificationCompleted");
        },
        codeSent: (String verificationId, int? resendToken) {
          add(OtpReceivedOnPhone(
              verificationId: verificationId,
              token: resendToken,
              userName: event.userName));
          log("here===>codeSent");
        },
        verificationFailed: (FirebaseAuthException e) {
          add(OtpVerificationError(error: e.code));
          log("here===>${e.message}");
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifyOtp event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(OtpLoading());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OtpVerified(credential: credential, userName: event.userName));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _loginWithCredential(
      OtpVerified event, Emitter<AuthenticationStates> emit) async {
    try {
      await auth.signInWithCredential(event.credential).then((user) async {
        if (user.user != null) {
          Map userDetailsMap = {
            'customer_id': user.user!.uid,
            'customer_name': (event.userName.toString() == "null")
                ? "null"
                : event.userName.toString(),
            'customer_contact': user.user?.phoneNumber
          };
          log("post map====>$userDetailsMap");
          AuthenticationModel authenticationModel =
              await _authenticationRepository.authenticateUser(userDetailsMap);
          if (authenticationModel.status == 200) {
            _customerCache
                .setCompanyId(authenticationModel.data.companies[0].companyId);

            emit(PhoneOtpVerified());
          } else if (authenticationModel.status == 404) {
            emit(PhoneAuthError(error: authenticationModel.message.toString()));
            emit(AuthenticationFormLoaded(isLogin: true));
          } else {
            emit(PhoneAuthError(error: 'Something went wrong!'));
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(error: e.code));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  _onOtpVerificationError(
      OtpVerificationError event, Emitter<AuthenticationStates> emit) async {
    emit(PhoneAuthError(error: 'Something went wrong'));
    emit(AuthenticationFormLoaded(isLogin: true));
  }
}
