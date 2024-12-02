import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetDirectSellingInvoiceUseCase {
  final InvoiceRepository _repository;
  GetDirectSellingInvoiceUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSelligInvoiceModel>> execude(String purchaseId) async {
    return await _repository.directSellingInvoice(purchaseId);
  }
}
