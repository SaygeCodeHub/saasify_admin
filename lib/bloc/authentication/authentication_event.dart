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

class SwitchAuthentication extends AuthenticationEvents {
  final bool isLogin;
  final bool passwordHidden;

  SwitchAuthentication({required this.passwordHidden, required this.isLogin});
}

class HidePassword extends AuthenticationEvents {
  final bool passwordHidden;
  final bool isLogin;

  HidePassword({required this.isLogin, required this.passwordHidden});
}
