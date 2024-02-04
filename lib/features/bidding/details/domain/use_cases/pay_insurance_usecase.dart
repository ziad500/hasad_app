import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class PayInsuranceBiddingAdverticseUseCase {
  final BiddingDetailsRepository _repository;
  PayInsuranceBiddingAdverticseUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(String advertisementId) async {
    return await _repository.payInsuranceBiddingAdvertisement(advertisementId);
  }
}
