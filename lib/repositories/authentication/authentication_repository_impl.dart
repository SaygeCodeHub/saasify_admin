import '../../data/models/authentication/login_model.dart';
import '../../data/models/authentication/signup_model.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<SignUpModel> signUp(
      Map signUpDetails, String signUpCredentials) async {
    final response = await ClientServices().post(
        "${ApiConstants.baseUrl}signup?signup_credentials=$signUpCredentials",
        signUpDetails);
    return SignUpModel.fromJson(response);
  }

  @override
  Future<LoginModel> login(Map loginDetails, String loginId) async {
    final response = await ClientServices().post(
        "${ApiConstants.baseUrl}login?login_credentials=$loginId",
        loginDetails);
    return LoginModel.fromJson(response);
  }
}
