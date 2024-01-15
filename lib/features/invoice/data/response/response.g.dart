// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : InvoiceDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

InvoiceDataResponse _$InvoiceDataResponseFromJson(Map<String, dynamic> json) =>
    InvoiceDataResponse(
      invoiceNumber: json['invoice_number'] as String?,
      subtotal: json['subtotal'] as num?,
      tax: json['tax'] as num?,
      total: json['total'] as num?,
      advertisement: json['advertisement'] == null
          ? null
          : InvoiceadvertisementResponse.fromJson(
              json['advertisement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceDataResponseToJson(
        InvoiceDataResponse instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'total': instance.total,
      'advertisement': instance.advertisement,
    };

InvoiceadvertisementResponse _$InvoiceadvertisementResponseFromJson(
        Map<String, dynamic> json) =>
    InvoiceadvertisementResponse(
      id: json['id'] as int?,
      advertisementTypeId: json['advertisement_type_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      region: json['region'] == null
          ? null
          : LocationResponse.fromJson(json['region'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : LocationResponse.fromJson(json['city'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : LocationResponse.fromJson(json['district'] as Map<String, dynamic>),
      price: json['price'] as num?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InvoiceadvertisementResponseToJson(
        InvoiceadvertisementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advertisement_type_id': instance.advertisementTypeId,
      'title': instance.title,
      'description': instance.description,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'price': instance.price,
      'images': instance.images,
    };
