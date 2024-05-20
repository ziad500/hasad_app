import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';
import '../responses/auth_response.dart';

part 'auth_app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthAppServiceClient {
  factory AuthAppServiceClient(Dio dio, {String baseUrl}) = _AuthAppServiceClient;

  @POST("login")
  Future<MainUserAuthResponse> userLogin(
    @Part(name: "phone") String phone,
    @Part(name: "password") String password,
    @Part(name: "device_token") String deviceToken,
  );

  @POST("register")
  Future<SuccessResponse> userSignUp(
    @Part(name: "name") String name,
    @Part(name: "phone") int phone,
    @Part(name: "stc") int? stc,
    @Part(name: "password") String password,
    @Part(name: "password_confirmation") String passwordConfirmation,
    @Part(name: "device_token") String deviceToken,
  );

  @POST("check-phone-active-code")
  Future<MainUserAuthResponse> verifySignupCode(
      @Part(name: "phone") String phone, @Part(name: "code") String code);

  @POST("resend-active-code")
  Future<SuccessResponse> reSendSignupCode(@Part(name: "phone") String phone);

  @POST("send-reset-password-code")
  Future<dynamic> requestChangePassword(@Part(name: "phone") String phone);

  @POST("check-reset-password-code")
  Future<dynamic> verifyOtp(@Part(name: "phone") String phone, @Part(name: "code") String code);

  @POST("reset-password")
  Future<dynamic> resetPassword(
      @Part(name: "phone") String phone,
      @Part(name: "password") String password,
      @Part(name: "password_confirmation") String confirmPassword);

  @POST("profile/logout")
  Future<dynamic> logout();

  @POST("profile/delete-account")
  Future<dynamic> deleteAccount();
}
