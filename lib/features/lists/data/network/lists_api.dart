import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';
import '../responses/lists_response.dart';

part 'lists_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ListsAppServiceClient {
  factory ListsAppServiceClient(Dio dio, {String baseUrl}) = _ListsAppServiceClient;
//regions , departments , departments/type , inspection/types , inspection/includes , inspection/places
  @GET("{listEndPoint}")
  Future<ListsResponse> listsbyEndPoint(@Path('listEndPoint') String listEndPoint);

  @GET("cities")
  Future<ListsResponse> citiesLists(@Query("region_id") List<int> regionsIds);

  @GET("districts")
  Future<ListsResponse> districtsLists(@Query("region_id") List<int> regionsIds);

// الانواع اعتمادا علي القسم
  @GET("departments/same/type")
  Future<ListsResponse> typesLists(@Query("departments_id") List<int> departmentsIds);
}
