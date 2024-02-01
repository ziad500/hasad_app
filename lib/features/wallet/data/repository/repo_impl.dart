import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/wallet/data/mapper/mapper.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/domain/models/stc_model.dart';
import 'package:hasad_app/features/wallet/domain/repository/repo.dart';

class WalletRepositoryImpl implements WalletRepo {
  final WalletRemoteDataSource _dataSource;

  WalletRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, SuccessModel>> bankRecharge(BankRechargeRequest bankRechargeRequest) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _dataSource.bankRecharge(bankRechargeRequest);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> stcRecharge(STCRechargeRequest stcRechargeRequest) {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _dataSource.stcRecharge(stcRechargeRequest);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, StchRechargeModel>> getPaymentLink(STCRechargeRequest stcRechargeRequest) {
    return executeAndHandleError<StchRechargeModel>(() async {
      final response = await _dataSource.getPaymentLink(stcRechargeRequest);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, SuccessModel>> collectMoney() {
    return executeAndHandleError<SuccessModel>(() async {
      final response = await _dataSource.collectMoney();
      return response.toDomain();
    });
  }
}
