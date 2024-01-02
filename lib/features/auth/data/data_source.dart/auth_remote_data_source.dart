import '../network/auth_app_api.dart';
import '../network/auth_requests.dart';
import '../responses/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest);

  Future<MainUserAuthResponse> userSignUp(UserSignUpRequest userSignUpRequest);

  Future<dynamic> requestChangePassword(RequestChangePasswordRequest requestChangePasswordRequest);
  Future<dynamic> verifyOtp(VerifyOtpRequest verifyOtpRequest);
  Future<dynamic> resetPassword(ResetPasswordRequest resetPasswordRequest);
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
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest) =>
      _authAppServiceClient.userLogin(loginRequest.phone, loginRequest.password);

  @override
  Future<MainUserAuthResponse> userSignUp(UserSignUpRequest userSignUpRequest) =>
      _authAppServiceClient.userSignUp(
          userSignUpRequest.name,
          userSignUpRequest.phone,
          userSignUpRequest.stc,
          userSignUpRequest.password,
          userSignUpRequest.passwordConfirmation);
}
