import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:hasad_app/features/favorites/data/network/fav_api.dart';
import 'package:hasad_app/features/favorites/data/network/requests.dart';

abstract class FavoritesRemoteDataSource {
  Future<DirectSellingListResponse> favoritesList(GetFavoritesListReqeust getFavoritesListReqeust);

  Future<dynamic> addToFavorites(String? advertisementId);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final FavoritesAppServiceClient _favoritesAppServiceClient;
  FavoritesRemoteDataSourceImpl(
    this._favoritesAppServiceClient,
  );

  @override
  Future addToFavorites(String? advertisementId) =>
      _favoritesAppServiceClient.addToFavorites(advertisementId);

  @override
  Future<DirectSellingListResponse> favoritesList(
          GetFavoritesListReqeust getFavoritesListReqeust) =>
      _favoritesAppServiceClient.favoritesList(
          getFavoritesListReqeust.page, getFavoritesListReqeust.type);
}
