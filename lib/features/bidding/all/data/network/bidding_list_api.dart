import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'bidding_list_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class BiddingListAppServiceClient {
  factory BiddingListAppServiceClient(Dio dio, {String baseUrl}) = _BiddingListAppServiceClient;

  @GET("advertisement/auctions/{type}")
  Future<DirectSellingListResponse> biddingList(
    @Path("type") String type,
    @Query('agriculture_type_id') String? agricultureTypeId,
    @Query('packaging_type_id') String? packagingTypeId,
    @Query('harvest_date') String? harvestDate,
    @Query('region_id') String? regionId,
    @Query('city_id') String? cityId,
    @Query('district_id') String? districtId,
    @Query('lowest_price') String? lowestPrice,
    @Query('highest_price') String? highestPrice,
    @Query('page') String? page,
    @Query('department_id ') String? departmentId,
  );

  @GET("advertisement/auctions/my")
  Future<DirectSellingListResponse> myBiddingList(
    @Query('page') String? page,
  );
}
