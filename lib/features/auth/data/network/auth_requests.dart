// ignore_for_file: public_member_api_docs; sort_constructors_first
import 'dart:io';

class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class InspectorSignUpRequest {
  String firstName;
  String lastName;
  String email;
  int phoneKey;
  int phoneNumber;
  int region;
  int city;
  int district;
  String addressDetails;
  String fullName;
  String password;
  String passwordConfirmation;
  int nationalIdNumber;
  File nationalIdFrontFace;
  File nationalIdBackFace;
  File personalPhoto;
  String stc;
  List<String> departments;
  List<String> departmentsTypes;
  List<String> regions;
  List<String> cities;
  List<String> districts;
  List<String> inspectionTypes;
  InspectorSignUpRequest(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneKey,
    this.phoneNumber,
    this.region,
    this.city,
    this.district,
    this.fullName,
    this.password,
    this.passwordConfirmation,
    this.nationalIdNumber,
    this.nationalIdFrontFace,
    this.nationalIdBackFace,
    this.personalPhoto,
    this.stc,
    this.departments,
    this.departmentsTypes,
    this.regions,
    this.cities,
    this.districts,
    this.addressDetails,
    this.inspectionTypes,
  );
}

class UserSignUpRequest {
  String firstName;
  String lastName;
  String email;
  int phoneKey;
  int phoneNumber;
  int region;
  int city;
  int district;
  String addressDetails;
  String password;
  String passwordConfirmation;
  UserSignUpRequest(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneKey,
    this.phoneNumber,
    this.region,
    this.city,
    this.district,
    this.addressDetails,
    this.password,
    this.passwordConfirmation,
  );
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
