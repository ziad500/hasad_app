// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse _$PaginationResponseFromJson(Map<String, dynamic> json) => PaginationResponse(
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      prevPageUrl: json['prev_page_url'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PaginationResponseToJson(PaginationResponse instance) => <String, dynamic>{
      'total': instance.total,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'prev_page_url': instance.prevPageUrl,
      'next_page_url': instance.nextPageUrl,
    };
