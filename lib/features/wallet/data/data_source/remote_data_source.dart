import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/data/network/wallet_api.dart';
import 'package:hasad_app/features/wallet/data/response/stc_response.dart';

abstract class WalletRemoteDataSource {
  Future<SuccessResponse> bankRecharge(BankRechargeRequest bankRechargeRequest);

  Future<SuccessResponse> stcRecharge(STCRechargeRequest stcRechargeRequest);

  Future<StchRechargeResponse> getPaymentLink(STCRechargeRequest stcRechargeRequest);

  Future<SuccessResponse> collectMoney();
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final WalletAppServiceClient _appServiceClient;
  WalletRemoteDataSourceImpl(
    this._appServiceClient,
  );

  @override
  Future<SuccessResponse> bankRecharge(BankRechargeRequest bankRechargeRequest) =>
      _appServiceClient.bankRecharge(bankRechargeRequest.value, bankRechargeRequest.depositSlip);
  @override
  Future<SuccessResponse> stcRecharge(STCRechargeRequest stcRechargeRequest) =>
      _appServiceClient.stcRecharge(stcRechargeRequest.value);

  @override
  Future<StchRechargeResponse> getPaymentLink(STCRechargeRequest stcRechargeRequest) =>
      _appServiceClient.getPaymentLink(stcRechargeRequest.value);

  @override
  Future<SuccessResponse> collectMoney() => _appServiceClient.collectMoney();
}
