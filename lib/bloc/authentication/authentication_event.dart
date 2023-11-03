import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvents {}

class GetOtp extends AuthenticationEvents {
  final String userName;
  final String phoneNo;

  GetOtp({required this.phoneNo, required this.userName});
}

class SwitchAuthentication extends AuthenticationEvents {
  final bool isLogin;

  SwitchAuthentication({required this.isLogin});
}

class OtpReceivedOnPhone extends AuthenticationEvents {
  final String verificationId;
  final int? token;
  final String userName;

  OtpReceivedOnPhone(
      {required this.verificationId,
      required this.token,
      required this.userName});
}

class VerifyOtp extends AuthenticationEvents {
  final String otpCode;
  final String verificationId;
  final String userName;

  VerifyOtp(
      {required this.otpCode,
      required this.verificationId,
      required this.userName});
}

class OtpVerified extends AuthenticationEvents {
  final AuthCredential credential;
  final String userName;

  OtpVerified({required this.credential, required this.userName});
}

class OtpVerificationError extends AuthenticationEvents {
  final String error;

  OtpVerificationError({required this.error});
}
