import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants.dart';
part 'request_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RequestAppServiceClient {
  factory RequestAppServiceClient(Dio dio, {String baseUrl}) = _RequestAppServiceClient;
  @POST("advertisement/add")
  Future<dynamic> addRequest(
      @Part(name: 'advertisement_type_id') String advertisementTypeId,
      @Part(name: 'department_id') String departmentId,
      @Part(name: 'department_type_id') String departmentTypeId,
      @Part(name: 'price_inclusion_ids[]') List<String> priceInclusionIds,
      @Part(name: 'agriculture_type_id') String agricultureTypeId,
      @Part(name: 'packaging_type_id') String packagingTypeId,
      @Part(name: 'harvest_date') String harvestDate,
      @Part(name: 'images[]') List<File> images,
      @Part(name: 'video') File video,
      @Part(name: 'title') String title,
      @Part(name: 'description') String description,
      @Part(name: 'region_id') String regionId,
      @Part(name: 'city_id') String cityId,
      @Part(name: 'district_id') String districtId,
      @Part(name: 'price') String price,
      @Part(name: 'starting_price') String? startingPrice,
      @Part(name: 'bidding_date') String? biddingDate,
      @Part(name: 'bidding_duration') String? biddingDuration,
      @Part(name: 'type') String? type,
      @Part(name: 'main_quantity') String? mainQuantity,
      @Part(name: 'cashback_percentage') String? cashbackPercentage,
      @Part(name: 'available_payment_on_delivery') String? availablePaymentOnDelivery);

  @POST("advertisement/edit")
  Future<dynamic> editRequest(
      @Part(name: 'advertisement_id') String advertisementId,
      @Part(name: 'advertisement_type_id') String advertisementTypeId,
      @Part(name: 'department_id') String departmentId,
      @Part(name: 'department_type_id') String departmentTypeId,
      @Part(name: 'price_inclusion_ids[]') List<String> priceInclusionIds,
      @Part(name: 'agriculture_type_id') String agricultureTypeId,
      @Part(name: 'packaging_type_id') String packagingTypeId,
      @Part(name: 'harvest_date') String harvestDate,
      @Part(name: 'images[]') List<File>? images,
      @Part(name: 'video') File? video,
      @Part(name: 'title') String title,
      @Part(name: 'description') String description,
      @Part(name: 'region_id') String regionId,
      @Part(name: 'city_id') String cityId,
      @Part(name: 'district_id') String districtId,
      @Part(name: 'price') String price,
      @Part(name: 'starting_price') String? startingPrice,
      @Part(name: 'bidding_date') String? biddingDate,
      @Part(name: 'bidding_duration') String? biddingDuration,
      @Part(name: 'deleted_images[]') List<String> deletedImages,
      @Part(name: 'type') String? type,
      @Part(name: 'main_quantity') String? mainQuantity,
      @Part(name: 'cashback_percentage') String? cashbackPercentage);
}
