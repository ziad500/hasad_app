import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';
import '../response/profile_response.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ProfileAppServiceClient {
  factory ProfileAppServiceClient(Dio dio, {String baseUrl}) = _ProfileAppServiceClient;
  @GET("profile")
  Future<ProfileResponse> getProfile();

  @POST("profile/edit")
  Future<ProfileResponse> editProfile(
    @Part(name: "name") String? name,
    @Part(name: "phone") String? phone,
    @Part(name: "stc") String? stc,
    @Part(name: "image") File? image,
  );
}
