import 'package:hasad_app/features/direct_selling/all/data/network/direct_selling_list_api.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/orders_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';

abstract class DirectSellingListRemoteDataSource {
  Future<DirectSellingListResponse> directSellingList(GetMainListRequest getMainListRequest);

  Future<DirectSellingListResponse> myDirectSellingList(String? page, String? userId);

  Future<DirectSellingOrdersListResponse> directSellingOrdersList(String? page);

  Future<dynamic> confirmOrder(String? purchaseInvoiceId, String? confirmationcode);

  // 1 => wallet
  // 2 => qrcode
  // 3 => link
  Future<dynamic> reCompletePayment(String? purchaseInvoiceId, String? paymentMethod);
}

class DirectSellingListRemoteDataSourceImpl implements DirectSellingListRemoteDataSource {
  final DirectSellingListAppServiceClient _directSellingListAppServiceClient;
  DirectSellingListRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<DirectSellingListResponse> directSellingList(GetMainListRequest getMainListRequest) =>
      _directSellingListAppServiceClient.directSellingList(
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
  Future<DirectSellingListResponse> myDirectSellingList(String? page, String? userId) =>
      _directSellingListAppServiceClient.myDirectSellingList(page, userId);

  @override
  Future<DirectSellingOrdersListResponse> directSellingOrdersList(String? page) =>
      _directSellingListAppServiceClient.directSellingOrdersList(page);

  @override
  Future confirmOrder(String? purchaseInvoiceId, String? confirmationcode) =>
      _directSellingListAppServiceClient.confirmOrder(purchaseInvoiceId, confirmationcode);
  @override
  Future reCompletePayment(String? purchaseInvoiceId, String? paymentMethod) =>
      _directSellingListAppServiceClient.reCompletePayment(purchaseInvoiceId, paymentMethod);
}
