import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/favorites/domain/repository/repo.dart';

import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetFavoritesListUseCase {
  final FavoritesRepository _repository;
  GetFavoritesListUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingListModel>> execude(
      GetFavoritesListReqeust getFavoritesListReqeust) async {
    return await _repository.favoritesList(getFavoritesListReqeust);
  }
}
