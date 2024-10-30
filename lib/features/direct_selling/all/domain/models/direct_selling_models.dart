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
  LocationModel? department;
  LocationModel? advertisementType;
  LocationModel? departmentType;
  String? video;
  String? createdAt;
  ProfileDataModel? owner;
  LastBidModel? lastBid;
  LocationModel? region;
  LocationModel? city;
  LocationModel? district;
  num? price;
  List<LocationModel>? images;
  List<LocationModel>? priceInclusions;
  num? purchasingPrice;
  num? auctionPrice;
  String? expiryTime;
  num? closed;
  num? numberOfAuctions;
  String? biddingDate;
  num? purchaseTax;
  num? priceAfterTax;
  String? biddingDuration;
  String? type;
  String? mainQuantity;
  String? subQuantity;
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
      this.purchaseTax,
      this.lastBid,
      this.biddingDuration,
      this.type,
      this.mainQuantity,
      this.subQuantity);
}

class TypeModel {
  String? name;
  String? image;
  int? id;

  TypeModel(this.image, this.name, this.id);
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

class LastBidModel {
  num? value;
  String? name;
  String? image;
  String? createdAt;
  LastBidModel(
    this.value,
    this.name,
    this.image,
    this.createdAt,
  );
}
