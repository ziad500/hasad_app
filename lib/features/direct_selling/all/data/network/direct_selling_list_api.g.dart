// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direct_selling_list_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DirectSellingListAppServiceClient
    implements DirectSellingListAppServiceClient {
  _DirectSellingListAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://alhasad.sa/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DirectSellingListResponse> directSellingList(
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
      r'department_id ': departmentId,
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
              'advertisement/direct-selling',
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
  Future<DirectSellingListResponse> myDirectSellingList(String? page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
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
              'advertisement/direct-selling/my',
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
  Future<DirectSellingOrdersListResponse> directSellingOrdersList(
      String? page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DirectSellingOrdersListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'advertisement/direct-selling/order',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DirectSellingOrdersListResponse.fromJson(_result.data!);
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
