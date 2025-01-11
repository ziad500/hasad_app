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
      json['id'] as num?,
      json['daftra_user_id'] as num?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as num?,
      json['stc'] as num?,
      json['role_id'] as num?,
      json['phone_verified_at'] as String?,
      json['image'] as String?,
      json['lang'] as String?,
      json['device_token'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
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
    };

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) =>
    BalanceResponse(
      json['id'] as num?,
      json['balance'] as String?,
      json['reserved_balance'] as String?,
      json['user_id'] as num?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
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
