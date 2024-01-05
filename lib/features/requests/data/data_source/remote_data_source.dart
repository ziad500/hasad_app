import 'package:hasad_app/features/requests/data/network/request_api.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';

abstract class RequestsRemoteDataSource {
  Future<dynamic> addRequest(AddRequestRequest addRequestRequest);
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
          addRequestRequest.biddingDuration);
}
