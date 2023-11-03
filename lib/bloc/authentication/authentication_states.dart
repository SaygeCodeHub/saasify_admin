abstract class AuthenticationStates {}

class AuthenticationInitial extends AuthenticationStates {}

class AuthenticationFormLoaded extends AuthenticationStates {
  final bool isLogin;

  AuthenticationFormLoaded({required this.isLogin});
}

class OtpLoading extends AuthenticationStates {}

class OtpReceived extends AuthenticationStates {
  final String verificationId;
  final String userName;

  OtpReceived({required this.verificationId, required this.userName});
}

class PhoneOtpVerified extends AuthenticationStates {}

class PhoneAuthError extends AuthenticationStates {
  final String error;

  PhoneAuthError({required this.error});
}
