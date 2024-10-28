// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StchRechargeResponse _$StchRechargeResponseFromJson(Map<String, dynamic> json) =>
    StchRechargeResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      url: json['data'] as String?,
    );

Map<String, dynamic> _$StchRechargeResponseToJson(StchRechargeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.url,
    };
