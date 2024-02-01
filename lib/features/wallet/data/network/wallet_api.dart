import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/response/stc_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants.dart';

part 'wallet_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class WalletAppServiceClient {
  factory WalletAppServiceClient(Dio dio, {String baseUrl}) = _WalletAppServiceClient;

  @POST("recharges/bank-transfer")
  Future<SuccessResponse> bankRecharge(
      @Part(name: "value") String value2, @Part(name: "deposit_slip") File depositSlip);

  @POST("recharges/card-stc")
  Future<SuccessResponse> stcRecharge(@Part(name: "value") String value2);

  @POST("recharges/payment")
  Future<StchRechargeResponse> getPaymentLink(@Part(name: "value") String value2);

  @GET("withdraw-balance")
  Future<SuccessResponse> collectMoney();
}
