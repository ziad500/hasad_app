import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/Slider/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SlidersAppServiceClient {
  factory SlidersAppServiceClient(Dio dio, {String baseUrl}) = _SlidersAppServiceClient;

  @GET("sliders")
  Future<SliderResponse> getSliders();
}
