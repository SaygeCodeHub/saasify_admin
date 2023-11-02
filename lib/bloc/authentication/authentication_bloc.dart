import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import '../../data/models/authentication/login_model.dart';
import '../../data/models/authentication/signup_model.dart';
import '../../di/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';
import 'authentication_event.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => SignUpInitial();

  AuthenticationBloc() : super(SignUpInitial()) {
    on<SignUp>(_signUp);
    on<Login>(_login);
    on<SwitchAuthentication>(_switchLogin);
    on<HidePassword>(_hidePassword);
  }

  FutureOr<void> _signUp(
      SignUp event, Emitter<AuthenticationStates> emit) async {
    emit(SignUpLoading());
    try {
      Map signUpDetails = {
        "company_password": event.companyPassword,
        "full_name": event.fullName
      };
      SignUpModel signUpModel = await _authenticationRepository.signUp(
          signUpDetails, event.signUpCredentials);
      if (signUpModel.status == 200) {
        emit(SignUpLoaded(
            signUpModel: signUpModel, signUpDetails: signUpDetails));

        _customerCache.setSignUpCredentials(signUpModel.data.companyEmail);

        _customerCache.setCompanyId(signUpModel.data.companyId);
      } else {
        emit(SignUpError(message: signUpModel.message));
      }
    } catch (e) {
      emit(SignUpError(message: e.toString()));
    }
  }

  FutureOr<void> _login(Login event, Emitter<AuthenticationStates> emit) async {
    emit(LoggingIn());

    try {
      Map loginDetails = {
        "login_password": event.companyPassword,
      };
      LoginModel loginModel = await _authenticationRepository.login(
          loginDetails, event.loginCredentials);
      if (loginModel.status == 200) {
        emit(LoggedIn());

        _customerCache.setIsLoggedIn(true);

        _customerCache.setCompanyId(loginModel.data.companyId);
      } else {
        emit(LoginError(message: loginModel.message));
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  FutureOr<void> _switchLogin(
      SwitchAuthentication event, Emitter<AuthenticationStates> emit) {
    log('inside switch login');
    bool isLogin = !event.isLogin;
    emit(LoadAuthenticationForm(
        isLogin: isLogin, passwordHidden: event.passwordHidden));
  }

  FutureOr<void> _hidePassword(
      HidePassword event, Emitter<AuthenticationStates> emit) {
    bool passwordHidden = event.passwordHidden;
    emit(LoadAuthenticationForm(
        isLogin: event.isLogin, passwordHidden: passwordHidden));
  }
}
