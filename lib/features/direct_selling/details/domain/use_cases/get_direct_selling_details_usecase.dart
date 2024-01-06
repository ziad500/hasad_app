import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';
import 'package:hasad_app/features/direct_selling/details/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetDirectSellingDetailsUseCase {
  final DirectSellingDetailsRepository _repository;
  GetDirectSellingDetailsUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingDetailsModel>> execude(String advertisementId) async {
    return await _repository.getDirectSellingDetails(advertisementId);
  }
}
