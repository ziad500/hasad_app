import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';

import '../../../../../core/failure.dart';

abstract class BiddingRequestsRepository {
  Future<Either<Failure, BiddingRequestsModel>> getBiddingRequests(
      String? page, String? advertismentId);

  Future<Either<Failure, dynamic>> acceptOrReject(String? name);
}
