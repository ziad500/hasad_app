// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUserAuthResponse _$MainUserAuthResponseFromJson(
        Map<String, dynamic> json) =>
    MainUserAuthResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainUserAuthResponseToJson(
        MainUserAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as int?,
      stc: json['stc'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'stc': instance.stc,
      'image': instance.image,
    };

InespectorSignUpResponse _$InespectorSignUpResponseFromJson(
        Map<String, dynamic> json) =>
    InespectorSignUpResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InespectorSignUpResponseToJson(
        InespectorSignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
