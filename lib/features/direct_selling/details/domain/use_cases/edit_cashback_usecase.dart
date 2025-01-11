import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/details/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class EditCashBackUseCase {
  final DirectSellingDetailsRepository _repository;
  EditCashBackUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(
      String advertisementId, String? cashbackPercentage) async {
    return await _repository.editCashBack(advertisementId, cashbackPercentage);
  }
}
