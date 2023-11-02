abstract class AuthenticationEvents {}

class SignUp extends AuthenticationEvents {
  final String signUpCredentials;
  final String companyPassword;
  final String fullName;

  SignUp({
    required this.signUpCredentials,
    required this.companyPassword,
    required this.fullName,
  });
}

class Login extends AuthenticationEvents {
  final String loginCredentials;
  final String companyPassword;

  Login({required this.loginCredentials, required this.companyPassword});
}

class SwitchLoginScreenEvent extends AuthenticationEvents {
  final bool isLogin;

  SwitchLoginScreenEvent({required this.isLogin});
}

class CheckIfLoggedIn extends AuthenticationEvents {}
