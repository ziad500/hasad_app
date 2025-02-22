import 'package:hasad_app/features/bidding_requests/data/network/bidding_requests_api.dart';
import 'package:hasad_app/features/bidding_requests/data/response/response.dart';

abstract class BiddingRequestsRemoteDataSource {
  Future<BiddingRequestsResponse> getBiddingRequests(String? page, String? advertismentId);

  Future<dynamic> acceptOrReject(String? name);
}

class BiddingRequestsRemoteDataSourceImpl implements BiddingRequestsRemoteDataSource {
  final BiddingRequestsAppServiceClient _directSellingListAppServiceClient;
  BiddingRequestsRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future acceptOrReject(String? name) => _directSellingListAppServiceClient.acceptOrReject(name);

  @override
  Future<BiddingRequestsResponse> getBiddingRequests(String? page, String? advertismentId) =>
      _directSellingListAppServiceClient.getBiddingRequests(page, advertismentId);
}
