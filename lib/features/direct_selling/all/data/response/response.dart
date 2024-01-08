import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/pagination_response.dart';

part 'response.g.dart';

@JsonSerializable()
class DirectSellingListResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<DirectSellingDataResponse>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  DirectSellingListResponse({this.status, this.message, this.data, this.pagination});

  // from json
  factory DirectSellingListResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingListResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingListResponseToJson(this);
}

@JsonSerializable()
class DirectSellingDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "agriculture_type")
  TypeResponse? agricultureType;
  @JsonKey(name: "packaging_type")
  TypeResponse? packagingType;
  @JsonKey(name: "harvest_date")
  String? harvestDate;
  @JsonKey(name: "department")
  String? department;
  @JsonKey(name: "advertisement_type")
  String? advertisementType;
  @JsonKey(name: "department_type")
  String? departmentType;
  @JsonKey(name: "video")
  String? video;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "region")
  TypeResponse? region;
  @JsonKey(name: "city")
  TypeResponse? city;
  @JsonKey(name: "district")
  TypeResponse? district;
  @JsonKey(name: "price")
  num? price;
  @JsonKey(name: "purchasing_price")
  num? purchasingPrice;
  @JsonKey(name: "auction_price")
  num? auctionPrice;
  @JsonKey(name: "expiry_time")
  String? expiryTime;
  @JsonKey(name: "closed")
  String? closed;
  @JsonKey(name: "number_of_auctions")
  num? numberOfAuctions;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "price_inclusions")
  List<String>? priceInclusions;
  @JsonKey(name: "bidding_date")
  String? biddingDate;

  DirectSellingDataResponse(
      {this.city,
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
      this.user,
      this.video,
      this.priceInclusions,
      this.auctionPrice,
      this.closed,
      this.expiryTime,
      this.numberOfAuctions,
      this.purchasingPrice,
      this.biddingDate});

  // from json
  factory DirectSellingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingDataResponseToJson(this);
}

@JsonSerializable()
class TypeResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  TypeResponse({this.image, this.name});

  // from json
  factory TypeResponse.fromJson(Map<String, dynamic> json) => _$TypeResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'image')
  String? image;
  UserResponse({
    this.name,
    this.phone,
    this.image,
  });

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
