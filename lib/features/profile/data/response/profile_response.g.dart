// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: (json['phone'] as num?)?.toInt(),
      stc: (json['stc'] as num?)?.toInt(),
      image: json['image'] as String?,
      balance: json['balance'] as num?,
      reservedBalance: json['reserved_balance'] as num?,
      cashBacks: (json['cash_backs'] as List<dynamic>?)
          ?.map((e) => CashBack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'stc': instance.stc,
      'image': instance.image,
      'balance': instance.balance,
      'reserved_balance': instance.reservedBalance,
      'cash_backs': instance.cashBacks,
    };

CashBack _$CashBackFromJson(Map<String, dynamic> json) => CashBack(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      amount: json['amount'] as String?,
      percentage: json['percentage'] as String?,
      advertisment: json['advertisment'] == null
          ? null
          : DirectSellingDataResponse.fromJson(
              json['advertisment'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CashBackToJson(CashBack instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'advertisment': instance.advertisment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
