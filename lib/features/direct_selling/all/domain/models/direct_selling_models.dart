import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';

class DirectSellingListModel {
  bool? status;
  String? message;
  List<DirectSellingDataModel>? data;
  PaginationModel? pagination;

  DirectSellingListModel(this.status, this.message, this.data, this.pagination);
}

class DirectSellingDataModel {
  int? id;
  String? title;
  String? description;
  TypeModel? agricultureType;
  TypeModel? packagingType;
  String? harvestDate;
  String? department;
  String? advertisementType;
  String? departmentType;
  String? video;
  String? createdAt;
  ProfileDataModel? owner;
  LocationModel? region;
  LocationModel? city;
  LocationModel? district;
  num? price;
  List<String>? images;
  List<String>? priceInclusions;
  num? purchasingPrice;
  num? auctionPrice;
  String? expiryTime;
  String? closed;
  num? numberOfAuctions;
  String? biddingDate;
  num? purchaseTax;
  num? priceAfterTax;

  DirectSellingDataModel(
      this.city,
      this.description,
      this.district,
      this.id,
      this.images,
      this.price,
      this.region,
      this.title,
      this.advertisementType,
      this.agricultureType,
      this.createdAt,
      this.department,
      this.departmentType,
      this.harvestDate,
      this.packagingType,
      this.owner,
      this.video,
      this.priceInclusions,
      this.auctionPrice,
      this.closed,
      this.expiryTime,
      this.numberOfAuctions,
      this.purchasingPrice,
      this.biddingDate,
      this.priceAfterTax,
      this.purchaseTax);
}

class TypeModel {
  String? name;
  String? image;

  TypeModel(this.image, this.name);
}

class UserModel {
  String? name;
  String? phone;
  String? image;
  UserModel(
    this.name,
    this.phone,
    this.image,
  );
}

class LocationModel {
  String? name;
  int? id;

  LocationModel(this.id, this.name);
}
