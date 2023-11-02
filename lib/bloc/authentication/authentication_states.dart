import '../../data/models/authentication/signup_model.dart';

abstract class AuthenticationStates {}

class SignUpInitial extends AuthenticationStates {}

class SignUpLoading extends AuthenticationStates {}

class SignUpLoaded extends AuthenticationStates {
  final SignUpModel signUpModel;

  final Map signUpDetails;

  SignUpLoaded({required this.signUpModel, required this.signUpDetails});
}

class SignUpError extends AuthenticationStates {
  final String message;

  SignUpError({required this.message});
}

class LoggingIn extends AuthenticationStates {}

class LoggedIn extends AuthenticationStates {}

class LoginError extends AuthenticationStates {
  final String message;

  LoginError({required this.message});
}

class SwitchLoginScreen extends AuthenticationStates {
  final bool login;

  SwitchLoginScreen({required this.login});
}

class LoggedOut extends AuthenticationStates {}
