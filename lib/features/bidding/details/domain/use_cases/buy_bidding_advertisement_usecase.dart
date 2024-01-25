import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class BuyBiddingAdverticseUseCase {
  final BiddingDetailsRepository _repository;
  BuyBiddingAdverticseUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(String advertisementId) async {
    return await _repository.buyBiddingAdvertisement(advertisementId);
  }
}
