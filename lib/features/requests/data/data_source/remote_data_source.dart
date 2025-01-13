import 'package:hasad_app/features/requests/data/network/request_api.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';

abstract class RequestsRemoteDataSource {
  Future<dynamic> addRequest(AddRequestRequest addRequestRequest);
  Future<dynamic> editRequest(EditRequestRequest editRequestRequest);
}

class RequestsRemoteDataSourceImpl implements RequestsRemoteDataSource {
  final RequestAppServiceClient _requestsAppServiceClient;
  RequestsRemoteDataSourceImpl(
    this._requestsAppServiceClient,
  );

  @override
  Future<dynamic> addRequest(AddRequestRequest addRequestRequest) =>
      _requestsAppServiceClient.addRequest(
          addRequestRequest.advertisementTypeId,
          addRequestRequest.departmentId,
          addRequestRequest.departmentTypeId,
          addRequestRequest.priceInclusionIds,
          addRequestRequest.agricultureTypeId,
          addRequestRequest.packagingTypeId,
          addRequestRequest.harvestDate,
          addRequestRequest.images,
          addRequestRequest.video,
          addRequestRequest.title,
          addRequestRequest.description,
          addRequestRequest.regionId,
          addRequestRequest.cityId,
          addRequestRequest.districtId,
          addRequestRequest.price,
          addRequestRequest.startingPrice,
          addRequestRequest.biddingdate,
          addRequestRequest.biddingDuration,
          addRequestRequest.type,
          addRequestRequest.mainQuantity,
          addRequestRequest.cashbackPercentage,
          addRequestRequest.availablePaymentOnDelivery);

  @override
  Future editRequest(EditRequestRequest editRequestRequest) =>
      _requestsAppServiceClient.editRequest(
          editRequestRequest.advertisementId,
          editRequestRequest.advertisementTypeId,
          editRequestRequest.departmentId,
          editRequestRequest.departmentTypeId,
          editRequestRequest.priceInclusionIds,
          editRequestRequest.agricultureTypeId,
          editRequestRequest.packagingTypeId,
          editRequestRequest.harvestDate,
          editRequestRequest.images,
          editRequestRequest.video,
          editRequestRequest.title,
          editRequestRequest.description,
          editRequestRequest.regionId,
          editRequestRequest.cityId,
          editRequestRequest.districtId,
          editRequestRequest.price,
          editRequestRequest.startingPrice,
          editRequestRequest.biddingdate,
          editRequestRequest.biddingDuration,
          editRequestRequest.deletedImages,
          editRequestRequest.type,
          editRequestRequest.mainQuantity,
          editRequestRequest.cashbackPercentage);
}
