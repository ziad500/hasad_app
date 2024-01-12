import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, DirectSellingListModel>> favoritesList(
      GetFavoritesListReqeust getFavoritesListReqeust);

  Future<Either<Failure, dynamic>> addToFavorites(String? advertisementId);
}
