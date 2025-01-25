import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/bidding_requests/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'bidding_requests_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class BiddingRequestsAppServiceClient {
  factory BiddingRequestsAppServiceClient(Dio dio, {String baseUrl}) =
      _BiddingRequestsAppServiceClient;

  @GET("advertisement/auctions/my-pending-winning-auction")
  Future<BiddingRequestsResponse> getBiddingRequests(@Query("page") String? page);

  @GET("advertisement/auctions/{name}")
  Future<dynamic> acceptOrReject(@Path('name') String? name);
}
