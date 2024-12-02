// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      json['status'] as bool?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => UserDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      (json['id'] as num).toInt(),
      (json['daftra_user_id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String?,
      (json['phone'] as num).toInt(),
      (json['stc'] as num).toInt(),
      (json['role_id'] as num).toInt(),
      json['phone_verified_at'] as String,
      json['image'] as String,
      json['lang'] as String,
      json['device_token'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      BalanceResponse.fromJson(json['balance'] as Map<String, dynamic>),
      (json['advertisements'] as List<dynamic>)
          .map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['advertisement_direct_sale'] as List<dynamic>)
          .map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['advertisement_auction'] as List<dynamic>)
          .map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['auctions'] as List<dynamic>,
      (json['favourites'] as List<dynamic>)
          .map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['purchases'] as List<dynamic>,
      json['log_reserved_balances'] as List<dynamic>,
      (json['winning_auctions'] as List<dynamic>)
          .map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'daftra_user_id': instance.daftraUserId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'stc': instance.stc,
      'role_id': instance.roleId,
      'phone_verified_at': instance.phoneVerifiedAt,
      'image': instance.image,
      'lang': instance.lang,
      'device_token': instance.deviceToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'balance': instance.balance,
      'advertisements': instance.advertisements,
      'advertisement_direct_sale': instance.advertisementDirectSale,
      'advertisement_auction': instance.advertisementAuction,
      'auctions': instance.auctions,
      'favourites': instance.favourites,
      'purchases': instance.purchases,
      'log_reserved_balances': instance.logReservedBalances,
      'winning_auctions': instance.winningAuctions,
    };

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) =>
    BalanceResponse(
      (json['id'] as num).toInt(),
      json['balance'] as String,
      json['reserved_balance'] as String,
      (json['user_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'reserved_balance': instance.reservedBalance,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
