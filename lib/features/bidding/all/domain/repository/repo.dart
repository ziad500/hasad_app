import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class BiddingListRepository {
  Future<Either<Failure, DirectSellingListModel>> biddingList(
      GetMainListRequest getMainListRequest, String type);

  Future<Either<Failure, DirectSellingListModel>> myBiddingList(String? page, String? userId);

  Future<Either<Failure, BiddingOrdersListModel>> biddingOrdersList(String? page);

  Future<Either<Failure, SuccessModel>> buyOrderAfterWin(String? advertisementId);

  Future<Either<Failure, SuccessModel>> confirmOrder(String? purchaseInvoiceId);
}
