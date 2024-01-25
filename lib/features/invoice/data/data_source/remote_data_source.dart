import 'package:hasad_app/features/invoice/data/network/invoice_api.dart';
import 'package:hasad_app/features/invoice/data/response/bidding_invoice_response.dart';
import 'package:hasad_app/features/invoice/data/response/response.dart';

abstract class InvoiceRemoteDataSource {
  Future<DirectSellingInvoiceResponse> directSellingInvoice(String? purchaseId);

  Future<BiddingInvoiceResponse> biddingInvoice(String? purchaseId);
}

class InvoiceRemoteDataSourceImpl implements InvoiceRemoteDataSource {
  final InvoiceAppServiceClient _directSellingListAppServiceClient;
  InvoiceRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<BiddingInvoiceResponse> biddingInvoice(String? purchaseId) =>
      _directSellingListAppServiceClient.biddingInvoice(purchaseId);

  @override
  Future<DirectSellingInvoiceResponse> directSellingInvoice(String? purchaseId) =>
      _directSellingListAppServiceClient.directSellingInvoice(purchaseId);
}
