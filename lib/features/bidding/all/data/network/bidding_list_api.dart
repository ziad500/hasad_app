import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/data/response/orders_response.dart';
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
    @Query('department_id') String? departmentId,
    @Query('title') String? title,
  );

  @GET("advertisement/auctions/my")
  Future<DirectSellingListResponse> myBiddingList(
      @Query('page') String? page, @Query('user_id') String? userId);

  @GET("advertisement/auctions/winning-auctions")
  Future<BiddingOrdersListResponse> biddingOrdersList(@Query('page') String? page);

  @POST("advertisement/auctions/purchase/after-winning")
  Future<SuccessResponse> buyOrderAfterWin(@Part(name: 'advertisement_id') String? advertisementId);

  @POST("advertisement/received-successfully")
  Future<SuccessResponse> confirmOrder(@Part(name: 'purchase_invoice_id') String? purchaseInvoiceId,
      @Part(name: 'is_received') String? isReceived, @Part(name: 'reason') String? reason);

  @POST("auctions/confirm-code")
  Future<dynamic> confirmOrderByCode(
    @Part(name: 'purchase_invoice_id') String? purchaseInvoiceId,
    @Part(name: 'confirmation_code') String? confirmationcode,
  );
}
