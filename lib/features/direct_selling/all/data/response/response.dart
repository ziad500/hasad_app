import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/pagination_response.dart';
import '../../../../profile/data/response/profile_response.dart';

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
  LocationResponse? department;
  @JsonKey(name: "advertisement_type")
  LocationResponse? advertisementType;
  @JsonKey(name: "department_type")
  LocationResponse? departmentType;
  @JsonKey(name: "video")
  String? video;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "owner")
  ProfileDataResponse? owner;
  @JsonKey(name: "last_bid")
  LastBidResponse? lastBid;
  @JsonKey(name: "region")
  LocationResponse? region;
  @JsonKey(name: "city")
  LocationResponse? city;
  @JsonKey(name: "district")
  LocationResponse? district;
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
  List<LocationResponse>? images;
  @JsonKey(name: "price_inclusions")
  List<LocationResponse>? priceInclusions;
  @JsonKey(name: "bidding_date")
  String? biddingDate;
  @JsonKey(name: "purchase_tax")
  num? purchaseTax;
  @JsonKey(name: "price_after_tax")
  num? priceAfterTax;
  @JsonKey(name: "bidding_duration")
  String? biddingDuration;

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
      this.biddingDuration});

  // from json
  factory DirectSellingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingDataResponseToJson(this);
}

@JsonSerializable()
class LocationResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  int? id;

  LocationResponse({this.id, this.name});

  // from json
  factory LocationResponse.fromJson(Map<String, dynamic> json) => _$LocationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

@JsonSerializable()
class TypeResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "id")
  int? id;

  TypeResponse({this.image, this.name, this.id});

  // from json
  factory TypeResponse.fromJson(Map<String, dynamic> json) => _$TypeResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);
}

@JsonSerializable()
class LastBidResponse {
  @JsonKey(name: "value")
  num? value;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  String? createdAt;
  LastBidResponse({
    this.value,
    this.name,
    this.image,
    this.createdAt,
  });

  // from json
  factory LastBidResponse.fromJson(Map<String, dynamic> json) => _$LastBidResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$LastBidResponseToJson(this);
}
