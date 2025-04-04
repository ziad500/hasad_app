import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/direct_selling/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/orders_mapper.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import '../network/requests.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class DirectSellingListRepositoryImpl implements DirectSellingListRepository {
  final DirectSellingListRemoteDataSource _directSellingListRemoteDataSource;

  DirectSellingListRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingListModel>> directSellingList(
      GetMainListRequest getMainListRequest) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response =
          await _directSellingListRemoteDataSource.directSellingList(getMainListRequest);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSellingListModel>> myDirectSellingList(
      String? page, String? userId) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _directSellingListRemoteDataSource.myDirectSellingList(page, userId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSellingOrdersListModel>> directSellingOrdersList(String? page) {
    return executeAndHandleError<DirectSellingOrdersListModel>(() async {
      final response = await _directSellingListRemoteDataSource.directSellingOrdersList(page);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, dynamic>> confirmOrder(
      String? purchaseInvoiceId, String? confirmationcode) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _directSellingListRemoteDataSource.confirmOrder(
          purchaseInvoiceId, confirmationcode);
      return response;
    });
  }

  @override
  Future<Either<Failure, dynamic>> reCompletePayment(
      String? purchaseInvoiceId, String? paymentMethod) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _directSellingListRemoteDataSource.reCompletePayment(
          purchaseInvoiceId, paymentMethod);
      return response;
    });
  }
}
