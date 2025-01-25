import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';
import 'package:hasad_app/features/bidding_requests/domain/repository/repo.dart';
import '../../../../../core/failure.dart';

class GetBiddingRequestsUsecse {
  final BiddingRequestsRepository _repository;
  GetBiddingRequestsUsecse(
    this._repository,
  );

  Future<Either<Failure, BiddingRequestsModel>> execude(String page) async {
    return await _repository.getBiddingRequests(page);
  }
}
