/* import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'wallet_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class WalletAppServiceClient {
  factory WalletAppServiceClient(Dio dio, {String baseUrl}) = _WalletAppServiceClient;
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
 */