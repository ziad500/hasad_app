import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class ConfirmOrderUseCase {
  final BiddingListRepository _repository;
  ConfirmOrderUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(
      String? purchaseInvoiceId, String? isReceived, String? reason) async {
    return await _repository.confirmOrder(purchaseInvoiceId, isReceived, reason);
  }
}
