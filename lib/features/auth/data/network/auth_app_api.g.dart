// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthAppServiceClient implements AuthAppServiceClient {
  _AuthAppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://adeal.alhasad.sa/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MainUserAuthResponse> userLogin(
    String email,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<MainUserAuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MainUserAuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MainUserAuthResponse> inspectorLogin(
    String email,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<MainUserAuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'inspector/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MainUserAuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<InespectorSignUpResponse> inspectorSignUp(
    String firstName,
    String lastName,
    String email,
    int phoneKey,
    int phoneNumber,
    int region,
    int city,
    int district,
    String addressDetails,
    String fullName,
    String password,
    String passwordConfirmation,
    int nationalIdNumber,
    File nationalIdFrontFace,
    File nationalIdBackFace,
    File personalPhoto,
    String stc,
    List<String> departments,
    List<String> departmentsTypes,
    List<String> regions,
    List<String> cities,
    List<String> districts,
    List<String> inspectionTypes,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'first_name',
      firstName,
    ));
    _data.fields.add(MapEntry(
      'last_name',
      lastName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'phone_key',
      phoneKey.toString(),
    ));
    _data.fields.add(MapEntry(
      'phone_number',
      phoneNumber.toString(),
    ));
    _data.fields.add(MapEntry(
      'region',
      region.toString(),
    ));
    _data.fields.add(MapEntry(
      'city',
      city.toString(),
    ));
    _data.fields.add(MapEntry(
      'district',
      district.toString(),
    ));
    _data.fields.add(MapEntry(
      'address_details',
      addressDetails,
    ));
    _data.fields.add(MapEntry(
      'full_name',
      fullName,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'password_confirmation',
      passwordConfirmation,
    ));
    _data.fields.add(MapEntry(
      'national_id_number',
      nationalIdNumber.toString(),
    ));
    _data.files.add(MapEntry(
      'national_id_front_face',
      MultipartFile.fromFileSync(
        nationalIdFrontFace.path,
        filename: nationalIdFrontFace.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'national_id_back_face',
      MultipartFile.fromFileSync(
        nationalIdBackFace.path,
        filename: nationalIdBackFace.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'personal_photo',
      MultipartFile.fromFileSync(
        personalPhoto.path,
        filename: personalPhoto.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'stc',
      stc,
    ));
    for (var i in departments) {
      _data.fields.add(MapEntry('departments[]', i));
    }
    for (var i in departmentsTypes) {
      _data.fields.add(MapEntry('departments_types[]', i));
    }
    for (var i in regions) {
      _data.fields.add(MapEntry('regions[]', i));
    }
    for (var i in cities) {
      _data.fields.add(MapEntry('cities[]', i));
    }
    for (var i in districts) {
      _data.fields.add(MapEntry('districts[]', i));
    }
    for (var i in inspectionTypes) {
      _data.fields.add(MapEntry('inspection_types[]', i));
    }
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<InespectorSignUpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'inspector/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = InespectorSignUpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MainUserAuthResponse> userSignUp(
    String firstName,
    String lastName,
    String email,
    int phoneKey,
    int phoneNumber,
    int region,
    int city,
    int district,
    String addressDetails,
    String password,
    String passwordConfirmation,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'first_name',
      firstName,
    ));
    _data.fields.add(MapEntry(
      'last_name',
      lastName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'phone_key',
      phoneKey.toString(),
    ));
    _data.fields.add(MapEntry(
      'phone_number',
      phoneNumber.toString(),
    ));
    _data.fields.add(MapEntry(
      'region',
      region.toString(),
    ));
    _data.fields.add(MapEntry(
      'city',
      city.toString(),
    ));
    _data.fields.add(MapEntry(
      'district',
      district.toString(),
    ));
    _data.fields.add(MapEntry(
      'address_details',
      addressDetails,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'password_confirmation',
      passwordConfirmation,
    ));
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<MainUserAuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MainUserAuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> requestChangePassword(String email) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'reset/password',
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
  Future<dynamic> verifyOtp(
    String email,
    String code,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'code',
      code,
    ));
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'code/confirm',
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
  Future<dynamic> resetPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'password_confirmation',
      confirmPassword,
    ));
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'reset/password/confirm',
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
