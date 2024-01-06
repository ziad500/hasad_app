import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetBiddingDetailsUseCase {
  final BiddingDetailsRepository _repository;
  GetBiddingDetailsUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingDetailsModel>> execude(String advertisementId) async {
    return await _repository.getBiddingDetails(advertisementId);
  }
}
