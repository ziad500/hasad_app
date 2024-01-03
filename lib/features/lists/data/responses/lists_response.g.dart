// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsResponse _$ListsResponseFromJson(Map<String, dynamic> json) =>
    ListsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListsResponseToJson(ListsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ListsDataResponse _$ListsDataResponseFromJson(Map<String, dynamic> json) =>
    ListsDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ListsDataResponseToJson(ListsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
