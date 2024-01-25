import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/features/invoice/data/response/bidding_invoice_response.dart';
import 'package:hasad_app/features/invoice/data/response/response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'invoice_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class InvoiceAppServiceClient {
  factory InvoiceAppServiceClient(Dio dio, {String baseUrl}) = _InvoiceAppServiceClient;

  @GET("advertisement/direct-selling/purchase-invoice")
  Future<DirectSellingInvoiceResponse> directSellingInvoice(
      @Query('purchase_invoice_id') String? purchaseId);

  @GET("advertisement/auctions/purchase-invoice")
  Future<BiddingInvoiceResponse> biddingInvoice(@Query('purchase_invoice_id') String? purchaseId);
}
