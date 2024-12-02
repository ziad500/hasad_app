// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SliderDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SliderDataResponse _$SliderDataResponseFromJson(Map<String, dynamic> json) =>
    SliderDataResponse(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$SliderDataResponseToJson(SliderDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
