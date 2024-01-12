import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'fav_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class FavoritesAppServiceClient {
  factory FavoritesAppServiceClient(Dio dio, {String baseUrl}) = _FavoritesAppServiceClient;

  @GET("advertisement/{type}/favourites")
  Future<DirectSellingListResponse> favoritesList(
      @Query('page') String? page, @Path('type') String type);

  @POST("advertisement/favorite")
  Future<dynamic> addToFavorites(@Part(name: "advertisement_id") String? advertisementId);
}
