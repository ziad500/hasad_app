import 'package:hasad_app/features/invoice/domain/models/bidding.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, DirectSelligInvoiceModel>> directSellingInvoice(String purchaseId);

  Future<Either<Failure, BiddingInvoiceModel>> biddingInvoice(String? purchaseId);
}
