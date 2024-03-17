import 'package:hasad_app/features/Slider/data/response/response.dart';
import 'package:hasad_app/features/slider/data/network/api.dart';

abstract class SliderRemoteDataSource {
  Future<SliderResponse> getSliders();
}

class SliderRemoteDataSourceImpl implements SliderRemoteDataSource {
  final SlidersAppServiceClient _appServiceClient;
  SliderRemoteDataSourceImpl(
    this._appServiceClient,
  );

  @override
  Future<SliderResponse> getSliders() => _appServiceClient.getSliders();
}
