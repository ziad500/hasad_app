import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/direct_selling/all/data/response/orders_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'direct_selling_list_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class DirectSellingListAppServiceClient {
  factory DirectSellingListAppServiceClient(Dio dio, {String baseUrl}) =
      _DirectSellingListAppServiceClient;

  @GET("advertisement/direct-selling")
  Future<DirectSellingListResponse> directSellingList(
    @Query('agriculture_type_id') String? agricultureTypeId,
    @Query('packaging_type_id') String? packagingTypeId,
    @Query('harvest_date') String? harvestDate,
    @Query('region_id') String? regionId,
    @Query('city_id') String? cityId,
    @Query('district_id') String? districtId,
    @Query('lowest_price') String? lowestPrice,
    @Query('highest_price') String? highestPrice,
    @Query('page') String? page,
    @Query('department_id') String? departmentId,
    @Query('title') String? title,
  );

  @GET("advertisement/direct-selling/my")
  Future<DirectSellingListResponse> myDirectSellingList(
    @Query('page') String? page,
    @Query('user_id') String? userId,
  );

  @GET("advertisement/direct-selling/order")
  Future<DirectSellingOrdersListResponse> directSellingOrdersList(
    @Query('page') String? page,
  );
}
