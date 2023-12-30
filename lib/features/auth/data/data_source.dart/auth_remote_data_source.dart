import '../network/auth_app_api.dart';
import '../network/auth_requests.dart';
import '../responses/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<MainUserAuthResponse> inspectorLogin(LoginRequest loginRequest);
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest);

  Future<InespectorSignUpResponse> inspectorSignUp(InspectorSignUpRequest inspectorSignUpRequest);
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
  Future<MainUserAuthResponse> inspectorLogin(LoginRequest loginRequest) =>
      _authAppServiceClient.inspectorLogin(loginRequest.email, loginRequest.password);

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
  Future<InespectorSignUpResponse> inspectorSignUp(InspectorSignUpRequest inspectorSignUpRequest) =>
      _authAppServiceClient.inspectorSignUp(
          inspectorSignUpRequest.firstName,
          inspectorSignUpRequest.lastName,
          inspectorSignUpRequest.email,
          inspectorSignUpRequest.phoneKey,
          inspectorSignUpRequest.phoneNumber,
          inspectorSignUpRequest.region,
          inspectorSignUpRequest.city,
          inspectorSignUpRequest.district,
          inspectorSignUpRequest.addressDetails,
          inspectorSignUpRequest.fullName,
          inspectorSignUpRequest.password,
          inspectorSignUpRequest.passwordConfirmation,
          inspectorSignUpRequest.nationalIdNumber,
          inspectorSignUpRequest.nationalIdFrontFace,
          inspectorSignUpRequest.nationalIdBackFace,
          inspectorSignUpRequest.personalPhoto,
          inspectorSignUpRequest.stc,
          inspectorSignUpRequest.departments,
          inspectorSignUpRequest.departmentsTypes,
          inspectorSignUpRequest.regions,
          inspectorSignUpRequest.cities,
          inspectorSignUpRequest.districts,
          inspectorSignUpRequest.inspectionTypes);

  @override
  Future<MainUserAuthResponse> userLogin(LoginRequest loginRequest) =>
      _authAppServiceClient.userLogin(loginRequest.email, loginRequest.password);

  @override
  Future<MainUserAuthResponse> userSignUp(UserSignUpRequest userSignUpRequest) =>
      _authAppServiceClient.userSignUp(
          userSignUpRequest.firstName,
          userSignUpRequest.lastName,
          userSignUpRequest.email,
          userSignUpRequest.phoneKey,
          userSignUpRequest.phoneNumber,
          userSignUpRequest.region,
          userSignUpRequest.city,
          userSignUpRequest.district,
          userSignUpRequest.addressDetails,
          userSignUpRequest.password,
          userSignUpRequest.passwordConfirmation);
}
