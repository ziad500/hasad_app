// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class AddRequestRequest {
  String advertisementTypeId;
  String departmentId;
  String departmentTypeId;
  List<String> priceInclusionIds;
  String agricultureTypeId;
  String packagingTypeId;
  String harvestDate;
  List<File> images;
  File video;
  String title;
  String description;
  String regionId;
  String cityId;
  String districtId;
  String price;
  String? startingPrice;
  String? biddingdate;
  String? biddingDuration;
  String? type;
  String? mainQuantity;
  AddRequestRequest(
      {required this.advertisementTypeId,
      required this.departmentId,
      required this.departmentTypeId,
      required this.priceInclusionIds,
      required this.agricultureTypeId,
      required this.packagingTypeId,
      required this.harvestDate,
      required this.images,
      required this.video,
      required this.title,
      required this.description,
      required this.regionId,
      required this.cityId,
      required this.districtId,
      required this.price,
      this.startingPrice,
      this.biddingdate,
      this.biddingDuration,
      this.type,
      this.mainQuantity});
}

class EditRequestRequest {
  String advertisementId;
  String advertisementTypeId;
  String departmentId;
  String departmentTypeId;
  List<String> priceInclusionIds;
  String agricultureTypeId;
  String packagingTypeId;
  String harvestDate;
  List<File>? images;
  File? video;
  String title;
  String description;
  String regionId;
  String cityId;
  String districtId;
  String price;
  String? startingPrice;
  String? biddingdate;
  String? biddingDuration;
  List<String> deletedImages;
  String? type;
  String? mainQuantity;
  EditRequestRequest(
      {required this.advertisementId,
      required this.advertisementTypeId,
      required this.departmentId,
      required this.departmentTypeId,
      required this.priceInclusionIds,
      required this.agricultureTypeId,
      required this.packagingTypeId,
      required this.harvestDate,
      required this.images,
      required this.video,
      required this.title,
      required this.description,
      required this.regionId,
      required this.cityId,
      required this.districtId,
      required this.price,
      this.startingPrice,
      this.biddingdate,
      this.biddingDuration,
      required this.deletedImages,
      this.type,
      this.mainQuantity});
}
