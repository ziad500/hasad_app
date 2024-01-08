import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/details/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class BuyDirectSellingUseCase {
  final DirectSellingDetailsRepository _repository;
  BuyDirectSellingUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(String advertisementId) async {
    return await _repository.buyDirectSelling(advertisementId);
  }
}
