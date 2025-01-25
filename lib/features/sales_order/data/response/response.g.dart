// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesOrdersResponse _$SalesOrdersResponseFromJson(Map<String, dynamic> json) =>
    SalesOrdersResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SalesOrdersDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesOrdersResponseToJson(
        SalesOrdersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

SalesOrdersDataResponse _$SalesOrdersDataResponseFromJson(
        Map<String, dynamic> json) =>
    SalesOrdersDataResponse(
      id: (json['id'] as num?)?.toInt(),
      purchaseInvoiceId: (json['purchase_invoice_id'] as num?)?.toInt(),
      isConfirmed: (json['is_confirmed'] as num?)?.toInt(),
      isPaid: (json['is_paid'] as num?)?.toInt(),
      advertisementId: (json['advertisement_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      receivedDate: json['received_date'] as String?,
      createdAt: json['created_at'] as String?,
      confirmationCode: json['confirmation_code'] as String?,
      paymentLinks: json['payment_links'] == null
          ? null
          : PaymentLinksResponse.fromJson(
              json['payment_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesOrdersDataResponseToJson(
        SalesOrdersDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchase_invoice_id': instance.purchaseInvoiceId,
      'is_confirmed': instance.isConfirmed,
      'is_paid': instance.isPaid,
      'advertisement_id': instance.advertisementId,
      'title': instance.title,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'received_date': instance.receivedDate,
      'created_at': instance.createdAt,
      'confirmation_code': instance.confirmationCode,
      'payment_links': instance.paymentLinks,
    };

PaymentLinksResponse _$PaymentLinksResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentLinksResponse(
      id: (json['id'] as num?)?.toInt(),
      price: json['price'] as String?,
      tax: json['tax'] as String?,
      total: json['total'] as String?,
      paymentUrl: json['payment_url'] as String?,
      advertisementId: (json['advertisement_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      qrCodePath: json['qr_code_path'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      purchaseId: (json['purchase_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentLinksResponseToJson(
        PaymentLinksResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'tax': instance.tax,
      'total': instance.total,
      'payment_url': instance.paymentUrl,
      'advertisement_id': instance.advertisementId,
      'user_id': instance.userId,
      'quantity': instance.quantity,
      'qr_code_path': instance.qrCodePath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'purchase_id': instance.purchaseId,
    };
