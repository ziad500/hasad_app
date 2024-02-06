// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiddingOrdersListResponse _$BiddingOrdersListResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingOrdersListResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BiddingOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BiddingOrdersListResponseToJson(
        BiddingOrdersListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

BiddingOrderResponse _$BiddingOrderResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingOrderResponse(
      purchaseInvoiceId: json['purchase_invoice_id'] as String?,
      advertisementId: json['advertisement_id'] as String?,
      title: json['title'] as String?,
      biddingDate: json['bidding_date'] as String?,
      expiryTime: json['expiry_time'] as String?,
      purchaseTax: json['purchase_tax'] as num?,
      priceAfterTax: json['price_after_tax'] as num?,
      price: json['price'] as num?,
      paymentdate: json['payment_date'] as String?,
      receivedDate: json['received_date'] as String?,
    );

Map<String, dynamic> _$BiddingOrderResponseToJson(
        BiddingOrderResponse instance) =>
    <String, dynamic>{
      'purchase_invoice_id': instance.purchaseInvoiceId,
      'advertisement_id': instance.advertisementId,
      'title': instance.title,
      'bidding_date': instance.biddingDate,
      'expiry_time': instance.expiryTime,
      'purchase_tax': instance.purchaseTax,
      'price_after_tax': instance.priceAfterTax,
      'price': instance.price,
      'payment_date': instance.paymentdate,
      'received_date': instance.receivedDate,
    };
