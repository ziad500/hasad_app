import 'package:hasad_app/features/bidding/details/data/network/bidding_details_api.dart';
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';

abstract class BiddingDetailsRemoteDataSource {
  Future<DirectSellingDetailsResponse> getBiddingDetails(String advertisementId);
}

class BiddingDetailsRemoteDataSourceImpl implements BiddingDetailsRemoteDataSource {
  final BiddingDetailsAppServiceClient _biddingDetailsAppServiceClient;
  BiddingDetailsRemoteDataSourceImpl(
    this._biddingDetailsAppServiceClient,
  );

  @override
  Future<DirectSellingDetailsResponse> getBiddingDetails(String advertisementId) =>
      _biddingDetailsAppServiceClient.getBiddingDetails(advertisementId);
}
