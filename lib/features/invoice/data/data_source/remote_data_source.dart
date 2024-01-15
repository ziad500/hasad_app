import 'package:hasad_app/features/invoice/data/network/invoice_api.dart';
import 'package:hasad_app/features/invoice/data/response/response.dart';

abstract class InvoiceRemoteDataSource {
  Future<InvoiceResponse> directSellingInvoice(String? purchaseId);

  Future<InvoiceResponse> biddingInvoice(String? purchaseId);
}

class InvoiceRemoteDataSourceImpl implements InvoiceRemoteDataSource {
  final InvoiceAppServiceClient _directSellingListAppServiceClient;
  InvoiceRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<InvoiceResponse> biddingInvoice(String? purchaseId) =>
      _directSellingListAppServiceClient.biddingInvoice(purchaseId);

  @override
  Future<InvoiceResponse> directSellingInvoice(String? purchaseId) =>
      _directSellingListAppServiceClient.directSellingInvoice(purchaseId);
}
