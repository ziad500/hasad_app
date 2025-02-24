// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  ProfileDataResponse? data;

  ProfileResponse({this.status, this.message, this.data});

  // from json
  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  int? phone;
  @JsonKey(name: 'stc')
  int? stc;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'balance')
  num? balance;
  @JsonKey(name: 'reserved_balance')
  num? reservedBalance;
  @JsonKey(name: "cash_backs")
  List<CashBack>? cashBacks;
  ProfileDataResponse(
      {this.id,
      this.name,
      this.phone,
      this.stc,
      this.image,
      this.balance,
      this.reservedBalance,
      this.cashBacks});

  // from json
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}

@JsonSerializable()
class CashBack {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_id")
  int? userId;

  @JsonKey(name: "amount")
  String? amount;

  @JsonKey(name: "percentage")
  String? percentage;

  @JsonKey(name: "advertisment")
  DirectSellingDataResponse? advertisment;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  CashBack({
    this.id,
    this.userId,
    this.amount,
    this.percentage,
    this.advertisment,
    this.createdAt,
    this.updatedAt,
  });

  /// From JSON
  factory CashBack.fromJson(Map<String, dynamic> json) => _$CashBackFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$CashBackToJson(this);
}

@JsonSerializable()
class SettingsResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  SettingsDataResponse? data;

  SettingsResponse({this.status, this.message, this.data});

  // from json
  factory SettingsResponse.fromJson(Map<String, dynamic> json) => _$SettingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SettingsResponseToJson(this);
}

@JsonSerializable()
class SettingsDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "auction_rate_increment")
  num? auctionRateIncrement;
  @JsonKey(name: "cashback_rate_increment")
  num? cashbackRateIncrement;

  SettingsDataResponse({this.id, this.auctionRateIncrement, this.cashbackRateIncrement});

  // from json
  factory SettingsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SettingsDataResponseToJson(this);
}
