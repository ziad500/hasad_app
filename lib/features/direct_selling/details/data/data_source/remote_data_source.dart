import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/details/data/network/direct_selling_details_api.dart';
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';

abstract class DirectSellingDetailsRemoteDataSource {
  Future<DirectSellingDetailsResponse> getDirectSellingDetails(String advertisementId);
  Future<SuccessResponse> buyDirectSellingDetails(
      String? advertisementId, int? quantity, int? paymentOnDelivery);
  Future<SuccessResponse> editCashBack(String? advertisementId, String? cashbackPercentage);
}

class DirectSellingDetailsRemoteDataSourceImpl implements DirectSellingDetailsRemoteDataSource {
  final DirectSellingDetailsAppServiceClient _directSellingDetailsAppServiceClient;
  DirectSellingDetailsRemoteDataSourceImpl(
    this._directSellingDetailsAppServiceClient,
  );

  @override
  Future<DirectSellingDetailsResponse> getDirectSellingDetails(String advertisementId) =>
      _directSellingDetailsAppServiceClient.getDirectSellingDetails(advertisementId);

  @override
  Future<SuccessResponse> buyDirectSellingDetails(
          String? advertisementId, int? quantity, int? paymentOnDelivery) =>
      _directSellingDetailsAppServiceClient.buyDirectSellingDetails(
          advertisementId, quantity, paymentOnDelivery);

  @override
  Future<SuccessResponse> editCashBack(String? advertisementId, String? cashbackPercentage) =>
      _directSellingDetailsAppServiceClient.editCashBack(advertisementId, cashbackPercentage);
}
