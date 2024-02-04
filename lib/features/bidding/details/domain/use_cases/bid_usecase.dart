import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class BidBiddingAdverticseUseCase {
  final BiddingDetailsRepository _repository;
  BidBiddingAdverticseUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(String advertisementId, String? bidPrice) async {
    return await _repository.bidBiddingAdvertisement(advertisementId, bidPrice);
  }
}
