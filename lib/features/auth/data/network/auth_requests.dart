class LoginRequest {
  String phone;
  String password;
  String deviceToken;
  LoginRequest(this.phone, this.password, this.deviceToken);
}

class UserSignUpRequest {
  String name;
  int phone;
  int? stc;
  String password;
  String passwordConfirmation;
  String? deviceToken;

  UserSignUpRequest(
      {required this.name,
      required this.phone,
      required this.stc,
      required this.password,
      required this.passwordConfirmation,
      this.deviceToken});
}

class ChangePasswordRequest {
  String firstName;
  String lastName;
  String email;
  int phoneKey;
  int phoneNumber;
  int region;
  int city;
  int district;
  String password;
  String passwordConfirmation;
  ChangePasswordRequest(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneKey,
    this.phoneNumber,
    this.region,
    this.city,
    this.district,
    this.password,
    this.passwordConfirmation,
  );
}

class RequestChangePasswordRequest {
  String email;
  RequestChangePasswordRequest(this.email);
}

class VerifyOtpRequest {
  String email;

  String otp;
  VerifyOtpRequest(this.email, this.otp);
}

class ResetPasswordRequest {
  String email;
  String newPassword;
  String confirmPassword;
  ResetPasswordRequest(this.confirmPassword, this.newPassword, this.email);
}

class SignUpWithGoogleRequest {
  String accessToken;
  String email;
  String name;
  String phoneNumber;
  SignUpWithGoogleRequest(this.accessToken, this.email, this.name, this.phoneNumber);
}

class SignInWithGoogleRequest {
  String accessToken;
  String email;

  SignInWithGoogleRequest(this.accessToken, this.email);
}

class SignUpWithAppleRequest {
  String identityToken;
  String authorizationCode;
  String? email;
  String? name;
  String phoneNumber;
  SignUpWithAppleRequest(
      this.identityToken, this.authorizationCode, this.email, this.name, this.phoneNumber);
}

class SignInWithAppleRequest {
  String identityToken;
  String authorizationCode;

  SignInWithAppleRequest(this.identityToken, this.authorizationCode);
}
