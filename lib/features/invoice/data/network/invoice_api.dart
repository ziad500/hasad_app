import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/invoice/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'invoice_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class InvoiceAppServiceClient {
  factory InvoiceAppServiceClient(Dio dio, {String baseUrl}) = _InvoiceAppServiceClient;

  @GET("advertisement/direct-selling/purchase-invoice")
  Future<InvoiceResponse> directSellingInvoice(@Query('purchase_invoice_id') String? purchaseId);

  @GET("advertisement/bidding/purchase-invoice")
  Future<InvoiceResponse> biddingInvoice(@Query('purchase_invoice_id') String? purchaseId);
}
