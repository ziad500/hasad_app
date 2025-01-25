import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/bidding_requests/domain/repository/repo.dart';
import '../../../../../core/failure.dart';

class AcceptOrRejectBiddingRequestsUsecase {
  final BiddingRequestsRepository _repository;
  AcceptOrRejectBiddingRequestsUsecase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(String page) async {
    return await _repository.acceptOrReject(page);
  }
}
