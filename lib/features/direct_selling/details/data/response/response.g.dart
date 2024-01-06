// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectSellingDetailsResponse _$DirectSellingDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingDetailsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DirectSellingDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectSellingDetailsResponseToJson(
        DirectSellingDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
