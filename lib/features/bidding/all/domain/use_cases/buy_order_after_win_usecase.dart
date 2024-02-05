import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class BuyOrderAfterWinOrderUseCase {
  final BiddingListRepository _repository;
  BuyOrderAfterWinOrderUseCase(
    this._repository,
  );

  Future<Either<Failure, SuccessModel>> execude(String? purchaseInvoiceId) async {
    return await _repository.buyOrderAfterWin(purchaseInvoiceId);
  }
}
