import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/data/network/bidding_list_api.dart';
import 'package:hasad_app/features/bidding/all/data/response/orders_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';

abstract class BiddingListRemoteDataSource {
  Future<DirectSellingListResponse> biddingList(GetMainListRequest getMainListRequest, String type);

  Future<DirectSellingListResponse> myBiddingList(String? page, String? userId);

  Future<BiddingOrdersListResponse> biddingOrdersList(String? page);

  Future<SuccessResponse> buyOrderAfterWin(String? advertisementId);

  Future<SuccessResponse> confirmOrder(
      String? purchaseInvoiceId, String? isReceived, String? reason);

  Future<SuccessResponse> confirmBiddingOrder(
      String? purchaseInvoiceId, String? isReceived, String? reason);

  Future<dynamic> confirmOrderByCode(String? purchaseInvoiceId, String? confirmationcode);
}

class BiddingListRemoteDataSourceImpl implements BiddingListRemoteDataSource {
  final BiddingListAppServiceClient _directSellingListAppServiceClient;
  BiddingListRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<DirectSellingListResponse> biddingList(
          GetMainListRequest getMainListRequest, String type) =>
      _directSellingListAppServiceClient.biddingList(
          type,
          getMainListRequest.agricultureTypeId,
          getMainListRequest.packagingTypeId,
          getMainListRequest.harvestDate,
          getMainListRequest.regionId,
          getMainListRequest.cityId,
          getMainListRequest.districtId,
          getMainListRequest.lowestPrice,
          getMainListRequest.highestPrice,
          getMainListRequest.page,
          getMainListRequest.departmentId,
          getMainListRequest.title);
  @override
  Future<DirectSellingListResponse> myBiddingList(String? page, String? userId) =>
      _directSellingListAppServiceClient.myBiddingList(page, userId);

  @override
  Future<BiddingOrdersListResponse> biddingOrdersList(String? page) =>
      _directSellingListAppServiceClient.biddingOrdersList(page);

  @override
  Future<SuccessResponse> buyOrderAfterWin(String? advertisementId) =>
      _directSellingListAppServiceClient.buyOrderAfterWin(advertisementId);

  @override
  Future<SuccessResponse> confirmOrder(
          String? purchaseInvoiceId, String? isReceived, String? reason) =>
      _directSellingListAppServiceClient.confirmOrder(purchaseInvoiceId, isReceived, reason);

  @override
  Future confirmOrderByCode(String? purchaseInvoiceId, String? confirmationcode) =>
      _directSellingListAppServiceClient.confirmOrderByCode(purchaseInvoiceId, confirmationcode);

  @override
  Future<SuccessResponse> confirmBiddingOrder(
          String? purchaseInvoiceId, String? isReceived, String? reason) =>
      _directSellingListAppServiceClient.confirmBiddingOrder(purchaseInvoiceId, isReceived, reason);
}
