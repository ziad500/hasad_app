import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/users_search/data/response/response.dart';
import 'package:hasad_app/features/users_search/domain/models/user_data_model.dart';

extension UsersResponseMapper on UsersResponse {
  UsersModel toDomain() {
    return UsersModel(
      status,
      message,
      data?.map((e) => e.toDomain()).toList(),
      pagination?.toDomain(),
    );
  }
}

extension UserDataResponseMapper on UserDataResponse {
  UserDataModel toDomain() {
    return UserDataModel(
      id,
      daftraUserId,
      name,
      email,
      phone,
      stc,
      roleId,
      phoneVerifiedAt,
      image,
      lang,
      deviceToken,
      createdAt,
      updatedAt,
      balance.toDomain(),
      advertisements.map((e) => e.toDomain()).toList(),
      advertisementDirectSale.map((e) => e.toDomain()).toList(),
      advertisementAuction.map((e) => e.toDomain()).toList(),
      auctions,
      favourites.map((e) => e.toDomain()).toList(),
      purchases,
      logReservedBalances,
      winningAuctions.map((e) => e.toDomain()).toList(),
    );
  }
}

extension BalanceResponseMapper on BalanceResponse {
  BalanceModel toDomain() {
    return BalanceModel(
      id,
      balance,
      reservedBalance,
      userId,
      createdAt,
      updatedAt,
    );
  }
}
