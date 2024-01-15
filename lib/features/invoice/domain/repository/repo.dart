import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, InvoiceModel>> directSellingInvoice(String purchaseId);

  Future<Either<Failure, InvoiceModel>> biddingInvoice(String? purchaseId);
}
