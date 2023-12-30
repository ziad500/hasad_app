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
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneKey: json['phone_key'] as String?,
      phoneNumber: json['phone_number'] as int?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      addressDetails: json['address_details'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_key': instance.phoneKey,
      'phone_number': instance.phoneNumber,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'address_details': instance.addressDetails,
      'photo': instance.photo,
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
