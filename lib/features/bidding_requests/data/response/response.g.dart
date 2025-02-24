// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiddingRequestsResponse _$BiddingRequestsResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingRequestsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              BiddingRequestsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BiddingRequestsResponseToJson(
        BiddingRequestsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };

BiddingRequestsDataResponse _$BiddingRequestsDataResponseFromJson(
        Map<String, dynamic> json) =>
    BiddingRequestsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      purchaseInvoiceId: json['purchase_invoice_id'] as String?,
      paymentDate: json['payment_date'] as String?,
      advertisementId: (json['advertisement_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      biddingDate: json['bidding_date'] as String?,
      expiryTime: json['expiry_time'] as String?,
      price: json['price'] as num?,
      purchaseTax: json['purchase_tax'] as num?,
      priceAfterTax: json['price_after_tax'] as num?,
      receivedDate: json['received_date'] as String?,
      quantity: json['quantity'] as String?,
      acceptedByOwner: (json['accepted_by_owner'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BiddingRequestsDataResponseToJson(
        BiddingRequestsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchase_invoice_id': instance.purchaseInvoiceId,
      'payment_date': instance.paymentDate,
      'advertisement_id': instance.advertisementId,
      'title': instance.title,
      'bidding_date': instance.biddingDate,
      'expiry_time': instance.expiryTime,
      'price': instance.price,
      'purchase_tax': instance.purchaseTax,
      'price_after_tax': instance.priceAfterTax,
      'received_date': instance.receivedDate,
      'quantity': instance.quantity,
      'accepted_by_owner': instance.acceptedByOwner,
    };
