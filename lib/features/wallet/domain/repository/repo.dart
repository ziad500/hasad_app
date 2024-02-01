import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/domain/models/stc_model.dart';

abstract class WalletRepo {
  Future<Either<Failure, SuccessModel>> bankRecharge(BankRechargeRequest bankRechargeRequest);

  Future<Either<Failure, SuccessModel>> stcRecharge(STCRechargeRequest stcRechargeRequest);

  Future<Either<Failure, StchRechargeModel>> getPaymentLink(STCRechargeRequest stcRechargeRequest);

  Future<Either<Failure, SuccessModel>> collectMoney();
}
