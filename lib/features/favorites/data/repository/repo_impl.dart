import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/favorites/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/favorites/data/network/requests.dart';
import 'package:hasad_app/features/favorites/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource _favoritesRemoteDataSource;

  FavoritesRepositoryImpl(this._favoritesRemoteDataSource);

  @override
  Future<Either<Failure, dynamic>> addToFavorites(String? advertisementId) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _favoritesRemoteDataSource.addToFavorites(advertisementId);
      return response;
    });
  }

  @override
  Future<Either<Failure, DirectSellingListModel>> favoritesList(
      GetFavoritesListReqeust getFavoritesListReqeust) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _favoritesRemoteDataSource.favoritesList(getFavoritesListReqeust);
      return response.toDomain();
    });
  }
}
