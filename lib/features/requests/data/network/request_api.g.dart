// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RequestAppServiceClient implements RequestAppServiceClient {
  _RequestAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://alhasad.sa/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> addRequest(
    String advertisementTypeId,
    String departmentId,
    String departmentTypeId,
    List<String> priceInclusionIds,
    String agricultureTypeId,
    String packagingTypeId,
    String harvestDate,
    List<File> images,
    File video,
    String title,
    String description,
    String regionId,
    String cityId,
    String districtId,
    String price,
    String? startingPrice,
    String? biddingDate,
    String? biddingDuration,
    String? type,
    String? mainQuantity,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'advertisement_type_id',
      advertisementTypeId,
    ));
    _data.fields.add(MapEntry(
      'department_id',
      departmentId,
    ));
    _data.fields.add(MapEntry(
      'department_type_id',
      departmentTypeId,
    ));
    for (var i in priceInclusionIds) {
      _data.fields.add(MapEntry('price_inclusion_ids[]', i));
    }
    _data.fields.add(MapEntry(
      'agriculture_type_id',
      agricultureTypeId,
    ));
    _data.fields.add(MapEntry(
      'packaging_type_id',
      packagingTypeId,
    ));
    _data.fields.add(MapEntry(
      'harvest_date',
      harvestDate,
    ));
    _data.files.addAll(images.map((i) => MapEntry(
        'images[]',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    _data.files.add(MapEntry(
      'video',
      MultipartFile.fromFileSync(
        video.path,
        filename: video.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'title',
      title,
    ));
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'region_id',
      regionId,
    ));
    _data.fields.add(MapEntry(
      'city_id',
      cityId,
    ));
    _data.fields.add(MapEntry(
      'district_id',
      districtId,
    ));
    _data.fields.add(MapEntry(
      'price',
      price,
    ));
    if (startingPrice != null) {
      _data.fields.add(MapEntry(
        'starting_price',
        startingPrice,
      ));
    }
    if (biddingDate != null) {
      _data.fields.add(MapEntry(
        'bidding_date',
        biddingDate,
      ));
    }
    if (biddingDuration != null) {
      _data.fields.add(MapEntry(
        'bidding_duration',
        biddingDuration,
      ));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'type',
        type,
      ));
    }
    if (mainQuantity != null) {
      _data.fields.add(MapEntry(
        'main_quantity',
        mainQuantity,
      ));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'advertisement/add',
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

  @override
  Future<dynamic> editRequest(
    String advertisementId,
    String advertisementTypeId,
    String departmentId,
    String departmentTypeId,
    List<String> priceInclusionIds,
    String agricultureTypeId,
    String packagingTypeId,
    String harvestDate,
    List<File>? images,
    File? video,
    String title,
    String description,
    String regionId,
    String cityId,
    String districtId,
    String price,
    String? startingPrice,
    String? biddingDate,
    String? biddingDuration,
    List<String> deletedImages,
    String? type,
    String? mainQuantity,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'advertisement_id',
      advertisementId,
    ));
    _data.fields.add(MapEntry(
      'advertisement_type_id',
      advertisementTypeId,
    ));
    _data.fields.add(MapEntry(
      'department_id',
      departmentId,
    ));
    _data.fields.add(MapEntry(
      'department_type_id',
      departmentTypeId,
    ));
    for (var i in priceInclusionIds) {
      _data.fields.add(MapEntry('price_inclusion_ids[]', i));
    }
    _data.fields.add(MapEntry(
      'agriculture_type_id',
      agricultureTypeId,
    ));
    _data.fields.add(MapEntry(
      'packaging_type_id',
      packagingTypeId,
    ));
    _data.fields.add(MapEntry(
      'harvest_date',
      harvestDate,
    ));
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'images[]',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    if (video != null) {
      _data.files.add(MapEntry(
        'video',
        MultipartFile.fromFileSync(
          video.path,
          filename: video.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    _data.fields.add(MapEntry(
      'title',
      title,
    ));
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'region_id',
      regionId,
    ));
    _data.fields.add(MapEntry(
      'city_id',
      cityId,
    ));
    _data.fields.add(MapEntry(
      'district_id',
      districtId,
    ));
    _data.fields.add(MapEntry(
      'price',
      price,
    ));
    if (startingPrice != null) {
      _data.fields.add(MapEntry(
        'starting_price',
        startingPrice,
      ));
    }
    if (biddingDate != null) {
      _data.fields.add(MapEntry(
        'bidding_date',
        biddingDate,
      ));
    }
    if (biddingDuration != null) {
      _data.fields.add(MapEntry(
        'bidding_duration',
        biddingDuration,
      ));
    }
    for (var i in deletedImages) {
      _data.fields.add(MapEntry('deleted_images[]', i));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'type',
        type,
      ));
    }
    if (mainQuantity != null) {
      _data.fields.add(MapEntry(
        'main_quantity',
        mainQuantity,
      ));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'advertisement/edit',
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
