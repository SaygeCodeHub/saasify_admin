import 'package:firebase_auth/firebase_auth.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future verifyPhoneNumber(
      {required String phoneNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AuthenticationModel> authenticateUser(Map userDetailsMap) async {
    try {
      final response = await ClientServices()
          .post("${ApiConstants.baseUrl}authenticateUser", userDetailsMap);
      return AuthenticationModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
