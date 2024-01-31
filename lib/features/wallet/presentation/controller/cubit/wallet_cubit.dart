import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/bank_recharge_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/stc_recharge_usecase.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final StcRechargeUseCase _stcRechargeUseCase;
  final BankRechargeUseCase _bankRechargeUseCase;
  WalletCubit(this._stcRechargeUseCase, this._bankRechargeUseCase) : super(WalletInitial());
  static WalletCubit get(context) => BlocProvider.of(context);
  Future bankRecharge() async {
    emit(BankRechargLoadingState());
    await _bankRechargeUseCase
        .execude(BankRechargeRequest(value: valueContoller.text, depositSlip: file!))
        .then((value) => value.fold((l) => emit(BankRechargErrorState(l.message)),
            (r) => emit(BankRechargSuccessState(r))));
  }

  Future stcRecharge() async {
    emit(StcRechargLoadingState());
    await _stcRechargeUseCase.execude(STCRechargeRequest(value: valueContoller.text)).then(
        (value) => value.fold(
            (l) => emit(StcRechargErrorState(l.message)), (r) => emit(StcRechargSuccessState())));
  }

  final TextEditingController valueContoller = TextEditingController();
  File? file;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
}
