import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/categories/data/response/categories_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'categories_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CategoriesAppServiceClient {
  factory CategoriesAppServiceClient(Dio dio, {String baseUrl}) = _CategoriesAppServiceClient;

  @GET("department")
  Future<CategoriesResponse> getCategories();

  @GET("department-types")
  Future<CategoriesResponse> getCategoriesTypes(@Query("department_id") String categoryId);
}
