import '../../data/models/authentication/login_model.dart';
import '../../data/models/authentication/signup_model.dart';

abstract class AuthenticationRepository {
  Future<SignUpModel> signUp(Map signUpDetails, String signUpCredentials);

  Future<LoginModel> login(Map loginDetails, String loginId);
}
