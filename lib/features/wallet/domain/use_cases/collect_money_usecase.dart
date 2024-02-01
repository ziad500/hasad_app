import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class CollectMoneyUseCase {
  final WalletRepo _repo;
  CollectMoneyUseCase(
    this._repo,
  );

  Future<Either<Failure, SuccessModel>> execude() async {
    return await _repo.collectMoney();
  }
}
