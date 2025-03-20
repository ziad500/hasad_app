import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class ConfirmOrderByCodeUseCase {
  final DirectSellingListRepository _repository;
  ConfirmOrderByCodeUseCase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(
      String? purchaseInvoiceId, String? confirmationcode) async {
    return await _repository.confirmOrder(purchaseInvoiceId, confirmationcode);
  }
}
