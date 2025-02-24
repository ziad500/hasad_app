import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class ProfileModel {
  bool? status;
  String? message;
  ProfileDataModel? data;

  ProfileModel(this.status, this.message, this.data);
}

class ProfileDataModel {
  int? id;
  String? name;
  int? phone;
  int? stc;
  String? image;
  num? balance;
  num? reservedBalance;
  List<CashBackModel>? cashback;

  ProfileDataModel(this.id, this.name, this.phone, this.stc, this.image, this.balance,
      this.reservedBalance, this.cashback);
}

class CashBackModel {
  int? id;
  int? userId;
  String? amount;
  String? percentage;
  DirectSellingDataModel? advertisment;
  String? createdAt;
  String? updatedAt;

  CashBackModel(
    this.id,
    this.userId,
    this.amount,
    this.percentage,
    this.advertisment,
    this.createdAt,
    this.updatedAt,
  );
}

class SettingsModel {
  bool? status;
  String? message;
  SettingsDataModel? data;

  SettingsModel(this.status, this.message, this.data);
}

class SettingsDataModel {
  int? id;
  num? auctionRateIncrement;
  num? cashbackRateIncrement;

  SettingsDataModel(this.id, this.auctionRateIncrement, this.cashbackRateIncrement);
}
