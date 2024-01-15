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
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as int?,
      stc: json['stc'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'stc': instance.stc,
      'image': instance.image,
    };
