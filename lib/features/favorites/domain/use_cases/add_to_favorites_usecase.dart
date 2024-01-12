import 'package:hasad_app/features/favorites/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository _repository;
  AddToFavoritesUseCase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(String advertisementId) async {
    return await _repository.addToFavorites(advertisementId);
  }
}
