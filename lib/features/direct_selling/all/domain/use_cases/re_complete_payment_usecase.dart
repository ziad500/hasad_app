import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class ReCompletePaymentUsecase {
  final DirectSellingListRepository _repository;
  ReCompletePaymentUsecase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(String? purchaseInvoiceId, String? paymentMethod) async {
    return await _repository.reCompletePayment(purchaseInvoiceId, paymentMethod);
  }
}
