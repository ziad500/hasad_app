import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/bidding_requests/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/bidding_requests/data/mapper/mapper.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';
import 'package:hasad_app/features/bidding_requests/domain/repository/repo.dart';
import '../../../../../core/failure.dart';

class BiddingRequestsRepositoryImpl implements BiddingRequestsRepository {
  final BiddingRequestsRemoteDataSource _directSellingListRemoteDataSource;

  BiddingRequestsRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, dynamic>> acceptOrReject(String? name) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _directSellingListRemoteDataSource.acceptOrReject(name);
      return response;
    });
  }

  @override
  Future<Either<Failure, BiddingRequestsModel>> getBiddingRequests(String? page) {
    return executeAndHandleError<BiddingRequestsModel>(() async {
      final response = await _directSellingListRemoteDataSource.getBiddingRequests(page);
      return response.toDomain();
    });
  }
}
