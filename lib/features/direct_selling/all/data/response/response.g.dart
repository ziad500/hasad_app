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
      city: json['city'] == null
          ? null
          : LocationResponse.fromJson(json['city'] as Map<String, dynamic>),
      description: json['description'] as String?,
      district: json['district'] == null
          ? null
          : LocationResponse.fromJson(json['district'] as Map<String, dynamic>),
      id: json['id'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => LocationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as num?,
      region: json['region'] == null
          ? null
          : LocationResponse.fromJson(json['region'] as Map<String, dynamic>),
      title: json['title'] as String?,
      advertisementType: json['advertisement_type'] == null
          ? null
          : LocationResponse.fromJson(
              json['advertisement_type'] as Map<String, dynamic>),
      agricultureType: json['agriculture_type'] == null
          ? null
          : TypeResponse.fromJson(
              json['agriculture_type'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      department: json['department'] == null
          ? null
          : LocationResponse.fromJson(
              json['department'] as Map<String, dynamic>),
      departmentType: json['department_type'] == null
          ? null
          : LocationResponse.fromJson(
              json['department_type'] as Map<String, dynamic>),
      harvestDate: json['harvest_date'] as String?,
      packagingType: json['packaging_type'] == null
          ? null
          : TypeResponse.fromJson(
              json['packaging_type'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : ProfileDataResponse.fromJson(json['owner'] as Map<String, dynamic>),
      video: json['video'] as String?,
      priceInclusions: (json['price_inclusions'] as List<dynamic>?)
          ?.map((e) => LocationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      auctionPrice: json['auction_price'] as num?,
      closed: json['closed'] as String?,
      expiryTime: json['expiry_time'] as String?,
      numberOfAuctions: json['number_of_auctions'] as num?,
      purchasingPrice: json['purchasing_price'] as num?,
      biddingDate: json['bidding_date'] as String?,
      priceAfterTax: json['price_after_tax'] as num?,
      purchaseTax: json['purchase_tax'] as num?,
      lastBid: json['last_bid'] == null
          ? null
          : LastBidResponse.fromJson(json['last_bid'] as Map<String, dynamic>),
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
      'owner': instance.owner,
      'last_bid': instance.lastBid,
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
      'bidding_date': instance.biddingDate,
      'purchase_tax': instance.purchaseTax,
      'price_after_tax': instance.priceAfterTax,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      image: json['image'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };

LastBidResponse _$LastBidResponseFromJson(Map<String, dynamic> json) =>
    LastBidResponse(
      value: json['value'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$LastBidResponseToJson(LastBidResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.createdAt,
    };
