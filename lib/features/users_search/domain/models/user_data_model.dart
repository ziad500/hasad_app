import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class UsersModel {
  bool? status;

  String? message;

  List<UserProfileModel>? data;

  PaginationModel? pagination;

  UsersModel(
    this.status,
    this.message,
    this.data,
    this.pagination,
  );
}

class UserProfileModel {
  num? id;

  num? daftraUserId;

  String? name;

  String? email;

  num? phone;

  num? stc;

  num? roleId;

  String? phoneVerifiedAt;

  String? image;

  String? lang;

  String? deviceToken;

  String? createdAt;

  String?
      updatedAt; /* 

  BalanceModel? balance;

  List<DirectSellingDataModel>? advertisements;

  List<DirectSellingDataModel>? advertisementDirectSale;

  List<DirectSellingDataModel>? advertisementAuction;

  List<dynamic>? auctions;

  List<DirectSellingDataModel>? favourites;

  List<dynamic>? purchases;

  List<dynamic>? logReservedBalances;

  List<DirectSellingDataModel>? winningAuctions;
 */
  UserProfileModel(
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
    /*   this.balance,
    this.advertisements,
    this.advertisementDirectSale,
    this.advertisementAuction,
    this.auctions,
    this.favourites,
    this.purchases,
    this.logReservedBalances,
    this.winningAuctions, */
  );
}

class BalanceModel {
  num? id;

  String? balance;

  String? reservedBalance;

  num? userId;

  String? createdAt;

  String? updatedAt;

  BalanceModel(
    this.id,
    this.balance,
    this.reservedBalance,
    this.userId,
    this.createdAt,
    this.updatedAt,
  );
}
