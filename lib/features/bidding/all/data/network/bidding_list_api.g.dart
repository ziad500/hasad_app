// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bidding_list_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BiddingListAppServiceClient implements BiddingListAppServiceClient {
  _BiddingListAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://alhasad.sa/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DirectSellingListResponse> biddingList(
    String type,
    String? agricultureTypeId,
    String? packagingTypeId,
    String? harvestDate,
    String? regionId,
    String? cityId,
    String? districtId,
    String? lowestPrice,
    String? highestPrice,
    String? page,
    String? departmentId,
    String? title,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'agriculture_type_id': agricultureTypeId,
      r'packaging_type_id': packagingTypeId,
      r'harvest_date': harvestDate,
      r'region_id': regionId,
      r'city_id': cityId,
      r'district_id': districtId,
      r'lowest_price': lowestPrice,
      r'highest_price': highestPrice,
      r'page': page,
      r'department_id': departmentId,
      r'title': title,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DirectSellingListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/auctions/${type}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DirectSellingListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DirectSellingListResponse> myBiddingList(
    String? page,
    String? userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'user_id': userId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DirectSellingListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/auctions/my',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DirectSellingListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BiddingOrdersListResponse> biddingOrdersList(String? page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BiddingOrdersListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/auctions/winning-auctions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BiddingOrdersListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SuccessResponse> buyOrderAfterWin(String? advertisementId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (advertisementId != null) {
      _data.fields.add(MapEntry(
        'advertisement_id',
        advertisementId,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SuccessResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/auctions/purchase/after-winning',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SuccessResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SuccessResponse> confirmOrder(
    String? purchaseInvoiceId,
    String? isReceived,
    String? reason,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (purchaseInvoiceId != null) {
      _data.fields.add(MapEntry(
        'purchase_invoice_id',
        purchaseInvoiceId,
      ));
    }
    if (isReceived != null) {
      _data.fields.add(MapEntry(
        'is_received',
        isReceived,
      ));
    }
    if (reason != null) {
      _data.fields.add(MapEntry(
        'reason',
        reason,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SuccessResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/received-successfully',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SuccessResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SuccessResponse> confirmBiddingOrder(
    String? purchaseInvoiceId,
    String? isReceived,
    String? reason,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (purchaseInvoiceId != null) {
      _data.fields.add(MapEntry(
        'purchase_invoice_id',
        purchaseInvoiceId,
      ));
    }
    if (isReceived != null) {
      _data.fields.add(MapEntry(
        'is_received',
        isReceived,
      ));
    }
    if (reason != null) {
      _data.fields.add(MapEntry(
        'reason',
        reason,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SuccessResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/auctions/received-successfully',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SuccessResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> confirmOrderByCode(
    String? purchaseInvoiceId,
    String? confirmationcode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (purchaseInvoiceId != null) {
      _data.fields.add(MapEntry(
        'purchase_invoice_id',
        purchaseInvoiceId,
      ));
    }
    if (confirmationcode != null) {
      _data.fields.add(MapEntry(
        'confirmation_code',
        confirmationcode,
      ));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'advertisement/auctions/confirm-code',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
