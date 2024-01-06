import 'package:hasad_app/features/direct_selling/details/data/network/direct_selling_details_api.dart';
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';

abstract class DirectSellingDetailsRemoteDataSource {
  Future<DirectSellingDetailsResponse> getDirectSellingDetails(String advertisementId);
}

class DirectSellingDetailsRemoteDataSourceImpl implements DirectSellingDetailsRemoteDataSource {
  final DirectSellingDetailsAppServiceClient _directSellingDetailsAppServiceClient;
  DirectSellingDetailsRemoteDataSourceImpl(
    this._directSellingDetailsAppServiceClient,
  );

  @override
  Future<DirectSellingDetailsResponse> getDirectSellingDetails(String advertisementId) =>
      _directSellingDetailsAppServiceClient.getDirectSellingDetails(advertisementId);
}
