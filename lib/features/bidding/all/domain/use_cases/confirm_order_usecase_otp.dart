import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class BiddingConfirmOrderByCodeUseCase {
  final BiddingListRepository _repository;
  BiddingConfirmOrderByCodeUseCase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(
      String? purchaseInvoiceId, String? confirmationcode) async {
    return await _repository.confirmOrderByCode(purchaseInvoiceId, confirmationcode);
  }
}
