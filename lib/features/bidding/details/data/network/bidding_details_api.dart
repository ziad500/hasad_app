import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'bidding_details_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class BiddingDetailsAppServiceClient {
  factory BiddingDetailsAppServiceClient(Dio dio, {String baseUrl}) =
      _BiddingDetailsAppServiceClient;

  @GET("advertisement/auctions/details")
  Future<DirectSellingDetailsResponse> getBiddingDetails(
      @Query('advertisement_id') String? advertisementId);
}
