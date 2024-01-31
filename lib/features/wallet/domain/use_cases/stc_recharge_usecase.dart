import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/domain/models/stc_model.dart';
import 'package:hasad_app/features/wallet/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class StcRechargeUseCase {
  final WalletRepo _repo;
  StcRechargeUseCase(
    this._repo,
  );

  Future<Either<Failure, StchRechargeModel>> execude(STCRechargeRequest stcRechargeRequest) async {
    return await _repo.stcRecharge(stcRechargeRequest);
  }
}
