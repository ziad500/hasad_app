import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/sales_order/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'sales_orders_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SalesOrdersAppServiceClient {
  factory SalesOrdersAppServiceClient(Dio dio, {String baseUrl}) = _SalesOrdersAppServiceClient;

  @GET("advertisement/direct-selling/seller/order")
  Future<SalesOrdersResponse> getSalesOrderes(
    @Query('page') String? page,
  );
}
