import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart'; // Make sure to generate this file

@JsonSerializable()
class UsersResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<UserDataResponse>? data;

  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  UsersResponse(
    this.status,
    this.message,
    this.data,
    this.pagination,
  );

  // from json
  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}

@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "daftra_user_id")
  int daftraUserId;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "phone")
  int phone;

  @JsonKey(name: "stc")
  int stc;

  @JsonKey(name: "role_id")
  int roleId;

  @JsonKey(name: "phone_verified_at")
  String phoneVerifiedAt;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "lang")
  String lang;

  @JsonKey(name: "device_token")
  String deviceToken;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  @JsonKey(name: "balance")
  BalanceResponse balance;

  @JsonKey(name: "advertisements")
  List<DirectSellingDataResponse> advertisements;

  @JsonKey(name: "advertisement_direct_sale")
  List<DirectSellingDataResponse> advertisementDirectSale;

  @JsonKey(name: "advertisement_auction")
  List<DirectSellingDataResponse> advertisementAuction;

  @JsonKey(name: "auctions")
  List<dynamic> auctions;

  @JsonKey(name: "favourites")
  List<DirectSellingDataResponse> favourites;

  @JsonKey(name: "purchases")
  List<dynamic> purchases;

  @JsonKey(name: "log_reserved_balances")
  List<dynamic> logReservedBalances;

  @JsonKey(name: "winning_auctions")
  List<DirectSellingDataResponse> winningAuctions;

  UserDataResponse(
    this.id,
    this.daftraUserId,
    this.name,
    this.email,
    this.phone,
    this.stc,
    this.roleId,
    this.phoneVerifiedAt,
    this.image,
    this.lang,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.balance,
    this.advertisements,
    this.advertisementDirectSale,
    this.advertisementAuction,
    this.auctions,
    this.favourites,
    this.purchases,
    this.logReservedBalances,
    this.winningAuctions,
  );

  // from json
  factory UserDataResponse.fromJson(Map<String, dynamic> json) => _$UserDataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class BalanceResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "balance")
  String balance;

  @JsonKey(name: "reserved_balance")
  String reservedBalance;

  @JsonKey(name: "user_id")
  int userId;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  BalanceResponse(
    this.id,
    this.balance,
    this.reservedBalance,
    this.userId,
    this.createdAt,
    this.updatedAt,
  );

  // from json
  factory BalanceResponse.fromJson(Map<String, dynamic> json) => _$BalanceResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);
}
