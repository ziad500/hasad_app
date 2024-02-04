import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/bidding/details/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/details/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class BiddingDetailsRepositoryImpl implements BiddingDetailsRepository {
  final BiddingDetailsRemoteDataSource _biddingDetailsRemoteDataSource;

  BiddingDetailsRepositoryImpl(this._biddingDetailsRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingDetailsModel>> getBiddingDetails(String advertisementId) {
    return executeAndHandleError<DirectSellingDetailsModel>(() async {
      final response = await _biddingDetailsRemoteDataSource.getBiddingDetails(advertisementId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> buyBiddingAdvertisement(String? advertisementId) {
    return executeAndHandleError<SuccessModel>(() async {
      final response =
          await _biddingDetailsRemoteDataSource.buyBiddingAdvertisement(advertisementId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> bidBiddingAdvertisement(
      String? advertisementId, String? bidPrice) {
    return executeAndHandleError<SuccessModel>(() async {
      final response =
          await _biddingDetailsRemoteDataSource.bidBiddingAdvertisement(advertisementId, bidPrice);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> payInsuranceBiddingAdvertisement(String? advertisementId) {
    return executeAndHandleError<SuccessModel>(() async {
      final response =
          await _biddingDetailsRemoteDataSource.payInsuranceBiddingAdvertisement(advertisementId);
      return response.toDomain();
    });
  }
}
