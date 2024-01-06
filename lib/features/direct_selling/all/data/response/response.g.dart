// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectSellingListResponse _$DirectSellingListResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingListResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DirectSellingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectSellingListResponseToJson(
        DirectSellingListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

DirectSellingDataResponse _$DirectSellingDataResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingDataResponse(
      city: json['city'] as String?,
      description: json['description'] as String?,
      district: json['district'] as String?,
      id: json['id'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as num?,
      region: json['region'] as String?,
      title: json['title'] as String?,
      advertisementType: json['advertisement_type'] as String?,
      agricultureType: json['agriculture_type'] == null
          ? null
          : TypeResponse.fromJson(
              json['agriculture_type'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      department: json['department'] as String?,
      departmentType: json['department_type'] as String?,
      harvestDate: json['harvest_date'] as String?,
      packagingType: json['packaging_type'] == null
          ? null
          : TypeResponse.fromJson(
              json['packaging_type'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      video: json['video'] as String?,
      priceInclusions: (json['price_inclusions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      auctionPrice: json['auction_price'] as num?,
      closed: json['closed'] as String?,
      expiryTime: json['expiry_time'] as String?,
      numberOfAuctions: json['number_of_auctions'] as num?,
      purchasingPrice: json['purchasing_price'] as num?,
    );

Map<String, dynamic> _$DirectSellingDataResponseToJson(
        DirectSellingDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'agriculture_type': instance.agricultureType,
      'packaging_type': instance.packagingType,
      'harvest_date': instance.harvestDate,
      'department': instance.department,
      'advertisement_type': instance.advertisementType,
      'department_type': instance.departmentType,
      'video': instance.video,
      'created_at': instance.createdAt,
      'user': instance.user,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'price': instance.price,
      'purchasing_price': instance.purchasingPrice,
      'auction_price': instance.auctionPrice,
      'expiry_time': instance.expiryTime,
      'closed': instance.closed,
      'number_of_auctions': instance.numberOfAuctions,
      'images': instance.images,
      'price_inclusions': instance.priceInclusions,
    };

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
    };
