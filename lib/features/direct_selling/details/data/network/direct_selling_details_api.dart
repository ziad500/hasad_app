import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'direct_selling_details_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class DirectSellingDetailsAppServiceClient {
  factory DirectSellingDetailsAppServiceClient(Dio dio, {String baseUrl}) =
      _DirectSellingDetailsAppServiceClient;

  @GET("advertisement/direct-selling/details")
  Future<DirectSellingDetailsResponse> getDirectSellingDetails(
      @Query('advertisement_id') String? advertisementId);
}
