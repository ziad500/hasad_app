import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/bidding/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class BiddingListRepositoryImpl implements BiddingListRepository {
  final BiddingListRemoteDataSource _biddingListRemoteDataSource;

  BiddingListRepositoryImpl(this._biddingListRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingListModel>> biddingList(
      GetMainListRequest getMainListRequest, String type) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _biddingListRemoteDataSource.biddingList(getMainListRequest, type);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSellingListModel>> myBiddingList(String? page, String? userId) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _biddingListRemoteDataSource.myBiddingList(page, userId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, BiddingOrdersListModel>> biddingOrdersList(String? page) {
    return executeAndHandleError<BiddingOrdersListModel>(() async {
      final response = await _biddingListRemoteDataSource.biddingOrdersList(page);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> buyOrderAfterWin(String? advertisementId) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _biddingListRemoteDataSource.buyOrderAfterWin(advertisementId);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> confirmOrder(
      String? purchaseInvoiceId, String? isReceived, String? reason) {
    return executeAndHandleError<SuccessModel>(() async {
      final response =
          await _biddingListRemoteDataSource.confirmOrder(purchaseInvoiceId, isReceived, reason);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, dynamic>> confirmOrderByCode(
      String? purchaseInvoiceId, String? confirmationcode) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _biddingListRemoteDataSource.confirmOrderByCode(
          purchaseInvoiceId, confirmationcode);
      return response;
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> confirmBiddingOrder(
      String? purchaseInvoiceId, String? isReceived, String? reason) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _biddingListRemoteDataSource.confirmBiddingOrder(
          purchaseInvoiceId, isReceived, reason);
      return response.toDomain();
    });
  }
}
