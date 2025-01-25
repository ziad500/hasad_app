import 'package:hasad_app/features/sales_order/data/network/sales_orders_api.dart';
import 'package:hasad_app/features/sales_order/data/response/response.dart';

abstract class SalesOrdersRemoteDataSource {
  Future<SalesOrdersResponse> getSalesOrderes(String page);
}

class SalesOrdersRemoteDataSourceImpl implements SalesOrdersRemoteDataSource {
  final SalesOrdersAppServiceClient _directSellingListAppServiceClient;
  SalesOrdersRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<SalesOrdersResponse> getSalesOrderes(String page) =>
      _directSellingListAppServiceClient.getSalesOrderes(page);
}
