import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/details/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/details/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';
import 'package:hasad_app/features/direct_selling/details/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class DirectSellingDetailsRepositoryImpl implements DirectSellingDetailsRepository {
  final DirectSellingDetailsRemoteDataSource _directSellingDetailsRemoteDataSource;

  DirectSellingDetailsRepositoryImpl(this._directSellingDetailsRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingDetailsModel>> getDirectSellingDetails(
      String advertisementId) {
    return executeAndHandleError<DirectSellingDetailsModel>(() async {
      final response =
          await _directSellingDetailsRemoteDataSource.getDirectSellingDetails(advertisementId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> buyDirectSelling(
      String advertisementId, int? quantity, int? paymentOnDelivery) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _directSellingDetailsRemoteDataSource.buyDirectSellingDetails(
          advertisementId, quantity, paymentOnDelivery);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> editCashBack(
      String? advertisementId, String? cashbackPercentage) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _directSellingDetailsRemoteDataSource.editCashBack(
          advertisementId, cashbackPercentage);
      return response.toDomain();
    });
  }
}
