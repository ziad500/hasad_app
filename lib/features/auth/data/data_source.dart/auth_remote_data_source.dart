import 'package:hasad_app/core/responses/success_response.dart';

import '../network/auth_app_api.dart';
import '../network/auth_requests.dart';
import '../responses/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest);

  Future<SuccessResponse> userSignUp(UserSignUpRequest userSignUpRequest);

  Future<MainUserAuthResponse> verifySignupCode(VerifyOtpRequest verifyOtpRequest);
  Future<SuccessResponse> reSendSignupCode(String phone);

  Future<dynamic> requestChangePassword(RequestChangePasswordRequest requestChangePasswordRequest);
  Future<dynamic> verifyOtp(VerifyOtpRequest verifyOtpRequest);
  Future<dynamic> resetPassword(ResetPasswordRequest resetPasswordRequest);

  Future<dynamic> logout(LogOutRequest logoutRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthAppServiceClient _authAppServiceClient;
  AuthRemoteDataSourceImpl(
    this._authAppServiceClient,
  );

  @override
  Future resetPassword(ResetPasswordRequest resetPasswordRequest) =>
      _authAppServiceClient.resetPassword(resetPasswordRequest.email,
          resetPasswordRequest.newPassword, resetPasswordRequest.confirmPassword);

  @override
  Future verifyOtp(VerifyOtpRequest verifyOtpRequest) =>
      _authAppServiceClient.verifyOtp(verifyOtpRequest.email, verifyOtpRequest.otp);

  @override
  Future requestChangePassword(RequestChangePasswordRequest requestChangePasswordRequest) =>
      _authAppServiceClient.requestChangePassword(requestChangePasswordRequest.email);

  @override
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest) => _authAppServiceClient
      .userLogin(loginRequest.phone, loginRequest.password, loginRequest.deviceToken);

  @override
  Future<SuccessResponse> userSignUp(UserSignUpRequest userSignUpRequest) =>
      _authAppServiceClient.userSignUp(
          userSignUpRequest.name,
          userSignUpRequest.phone,
          userSignUpRequest.stc,
          userSignUpRequest.password,
          userSignUpRequest.passwordConfirmation,
          userSignUpRequest.deviceToken!);

  @override
  Future<MainUserAuthResponse> verifySignupCode(VerifyOtpRequest verifyOtpRequest) =>
      _authAppServiceClient.verifySignupCode(verifyOtpRequest.email, verifyOtpRequest.otp);

  @override
  Future<SuccessResponse> reSendSignupCode(String phone) =>
      _authAppServiceClient.reSendSignupCode(phone);

  @override
  Future logout(LogOutRequest logoutRequest) => _authAppServiceClient.logout();
}
