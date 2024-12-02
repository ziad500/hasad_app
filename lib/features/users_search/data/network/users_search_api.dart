import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/users_search/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'users_search_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class UsersSearchAppServiceClient {
  factory UsersSearchAppServiceClient(Dio dio, {String baseUrl}) = _UsersSearchAppServiceClient;

  @GET("users")
  Future<UsersResponse> getUsers(@Query('name') String? userName, @Query('id') String? userId);
}
