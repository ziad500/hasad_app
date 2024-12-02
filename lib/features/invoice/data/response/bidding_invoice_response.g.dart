// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bidding_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiddingInvoiceResponse _$BiddingInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingInvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BiddingInvoiceDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BiddingInvoiceResponseToJson(
        BiddingInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BiddingInvoiceDataResponse _$BiddingInvoiceDataResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingInvoiceDataResponse(
      invoiceNumber: json['invoice_number'] as String?,
      subtotal: json['subtotal'] as num?,
      tax: json['tax'] as num?,
      total: json['total'] as num?,
      advertisement: json['advertisement'] == null
          ? null
          : BiddingInvoiceadvertisementResponse.fromJson(
              json['advertisement'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$BiddingInvoiceDataResponseToJson(
        BiddingInvoiceDataResponse instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'total': instance.total,
      'advertisement': instance.advertisement,
      'created_at': instance.createdAt,
    };

BiddingInvoiceadvertisementResponse
    _$BiddingInvoiceadvertisementResponseFromJson(Map<String, dynamic> json) =>
        BiddingInvoiceadvertisementResponse(
          id: (json['id'] as num?)?.toInt(),
          advertisementTypeId: json['advertisement_type_id'] as String?,
          title: json['title'] as String?,
          description: json['description'] as String?,
          region: json['region'] == null
              ? null
              : LocationResponse.fromJson(
                  json['region'] as Map<String, dynamic>),
          city: json['city'] == null
              ? null
              : LocationResponse.fromJson(json['city'] as Map<String, dynamic>),
          district: json['district'] == null
              ? null
              : LocationResponse.fromJson(
                  json['district'] as Map<String, dynamic>),
          purchasingPrice: json['purchasing_price'] as num?,
          auctionPrice: json['auction_price'] as num?,
          biddingDate: json['bidding_date'] as String?,
          expiryTime: json['expiry_time'] as String?,
          closed: json['closed'] as String?,
          numberOfAuctions: json['number_of_auctions'] as num?,
          images: (json['images'] as List<dynamic>?)
              ?.map((e) => LocationResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$BiddingInvoiceadvertisementResponseToJson(
        BiddingInvoiceadvertisementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advertisement_type_id': instance.advertisementTypeId,
      'title': instance.title,
      'description': instance.description,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'purchasing_price': instance.purchasingPrice,
      'auction_price': instance.auctionPrice,
      'bidding_date': instance.biddingDate,
      'expiry_time': instance.expiryTime,
      'closed': instance.closed,
      'number_of_auctions': instance.numberOfAuctions,
      'images': instance.images,
    };
