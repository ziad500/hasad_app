import 'package:hasad_app/features/Slider/data/response/response.dart';
import 'package:hasad_app/features/slider/domain/models/slider_model.dart';

extension SliderResponseMapper on SliderResponse? {
  SliderModel toDomain() {
    return SliderModel(this?.message, this?.status, this?.data?.map((e) => e.toDomain()).toList());
  }
}

extension SliderDataResponseMapper on SliderDataResponse? {
  SliderDataModel toDomain() {
    return SliderDataModel(this?.id, this?.path);
  }
}
