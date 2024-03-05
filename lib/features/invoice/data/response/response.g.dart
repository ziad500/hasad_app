// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectSellingInvoiceResponse _$DirectSellingInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingInvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DirectSellingInvoiceDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectSellingInvoiceResponseToJson(
        DirectSellingInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DirectSellingInvoiceDataResponse _$DirectSellingInvoiceDataResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingInvoiceDataResponse(
      invoiceNumber: json['invoice_number'] as String?,
      subtotal: json['subtotal'] as num?,
      tax: json['tax'] as num?,
      total: json['total'] as num?,
      advertisement: json['advertisement'] == null
          ? null
          : DirectSellingInvoiceadvertisementResponse.fromJson(
              json['advertisement'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$DirectSellingInvoiceDataResponseToJson(
        DirectSellingInvoiceDataResponse instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'total': instance.total,
      'quantity': instance.quantity,
      'advertisement': instance.advertisement,
      'created_at': instance.createdAt,
    };

DirectSellingInvoiceadvertisementResponse
    _$DirectSellingInvoiceadvertisementResponseFromJson(
            Map<String, dynamic> json) =>
        DirectSellingInvoiceadvertisementResponse(
          id: json['id'] as int?,
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
          price: json['price'] as num?,
          images: (json['images'] as List<dynamic>?)
              ?.map((e) => LocationResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$DirectSellingInvoiceadvertisementResponseToJson(
        DirectSellingInvoiceadvertisementResponse instance) =>
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
