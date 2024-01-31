// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StchRechargeResponse _$StchRechargeResponseFromJson(
        Map<String, dynamic> json) =>
    StchRechargeResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : StcRechargeDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StchRechargeResponseToJson(
        StchRechargeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

StcRechargeDataResponse _$StcRechargeDataResponseFromJson(
        Map<String, dynamic> json) =>
    StcRechargeDataResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StcRechargeDataResponseToJson(
        StcRechargeDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
