// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectSellingOrdersListResponse _$DirectSellingOrdersListResponseFromJson(
        Map<String, dynamic> json) =>
    DirectSellingOrdersListResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DirectSellingOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectSellingOrdersListResponseToJson(
        DirectSellingOrdersListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

DirectSellingOrderResponse _$DirectSellingOrderResponseFromJson(Map<String, dynamic> json) =>
    DirectSellingOrderResponse(
      purchaseInvoiceId: (json['purchase_invoice_id'] as num?)?.toInt(),
      advertisementId: (json['advertisement_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      createdAt: json['created_at'] as String?,
      receivedDate: json['received_date'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      isConfirmed: (json['is_confirmed'] as num?)?.toInt(),
      isPaid: (json['is_paid'] as num?)?.toInt(),
      isReceived: (json['is_received'] as num?)?.toInt(),
      rejectReason: json['reason'] as String?,
    );

Map<String, dynamic> _$DirectSellingOrderResponseToJson(DirectSellingOrderResponse instance) =>
    <String, dynamic>{
      'purchase_invoice_id': instance.purchaseInvoiceId,
      'advertisement_id': instance.advertisementId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'created_at': instance.createdAt,
      'received_date': instance.receivedDate,
      'quantity': instance.quantity,
      'is_confirmed': instance.isConfirmed,
      'is_paid': instance.isPaid,
      'is_received': instance.isReceived,
      'reason': instance.rejectReason
    };
