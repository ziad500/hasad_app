import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';
import '../responses/auth_response.dart';

part 'auth_app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthAppServiceClient {
  factory AuthAppServiceClient(Dio dio, {String baseUrl}) = _AuthAppServiceClient;

  @POST("user/login")
  Future<MainUserAuthResponse> userLogin(
      @Part(name: "email") String email, @Part(name: "password") String password);

  @POST("inspector/login")
  Future<MainUserAuthResponse> inspectorLogin(
      @Part(name: "email") String email, @Part(name: "password") String password);

  @POST("inspector/register")
  Future<InespectorSignUpResponse> inspectorSignUp(
      @Part(name: "first_name") String firstName,
      @Part(name: "last_name") String lastName,
      @Part(name: "email") String email,
      @Part(name: "phone_key") int phoneKey,
      @Part(name: "phone_number") int phoneNumber,
      @Part(name: "region") int region,
      @Part(name: "city") int city,
      @Part(name: "district") int district,
      @Part(name: "address_details") String addressDetails,
      @Part(name: "full_name") String fullName,
      @Part(name: "password") String password,
      @Part(name: "password_confirmation") String passwordConfirmation,
      @Part(name: "national_id_number") int nationalIdNumber,
      @Part(name: "national_id_front_face") File nationalIdFrontFace,
      @Part(name: "national_id_back_face") File nationalIdBackFace,
      @Part(name: "personal_photo") File personalPhoto,
      @Part(name: "stc") String stc,
      @Part(name: "departments[]") List<String> departments,
      @Part(name: "departments_types[]") List<String> departmentsTypes,
      @Part(name: "regions[]") List<String> regions,
      @Part(name: "cities[]") List<String> cities,
      @Part(name: "districts[]") List<String> districts,
      @Part(name: "inspection_types[]") List<String> inspectionTypes);

  @POST("user/register")
  Future<MainUserAuthResponse> userSignUp(
    @Part(name: "first_name") String firstName,
    @Part(name: "last_name") String lastName,
    @Part(name: "email") String email,
    @Part(name: "phone_key") int phoneKey,
    @Part(name: "phone_number") int phoneNumber,
    @Part(name: "region") int region,
    @Part(name: "city") int city,
    @Part(name: "district") int district,
    @Part(name: "address_details") String addressDetails,
    @Part(name: "password") String password,
    @Part(name: "password_confirmation") String passwordConfirmation,
  );

  @POST("reset/password")
  Future<dynamic> requestChangePassword(@Part(name: "email") String email);

  @POST("code/confirm")
  Future<dynamic> verifyOtp(@Part(name: "email") String email, @Part(name: "code") String code);

  @POST("reset/password/confirm")
  Future<dynamic> resetPassword(
      @Part(name: "email") String email,
      @Part(name: "password") String password,
      @Part(name: "password_confirmation") String confirmPassword);
}
