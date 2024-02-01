import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/wallet/data/network/requests.dart';
import 'package:hasad_app/features/wallet/domain/models/stc_model.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/bank_recharge_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/collect_money_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/get_payment_link_usecase.dart';
import 'package:hasad_app/features/wallet/domain/use_cases/stc_recharge_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final StcRechargeUseCase _stcRechargeUseCase;
  final BankRechargeUseCase _bankRechargeUseCase;
  final GetPaymentLinkUseCase _getPaymentLinkUseCase;
  final CollectMoneyUseCase _collectMoneyUseCase;

  WalletCubit(this._stcRechargeUseCase, this._bankRechargeUseCase, this._getPaymentLinkUseCase,
      this._collectMoneyUseCase)
      : super(WalletInitial());

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

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

  Future getPaymentLink() async {
    emit(GetPaymentLinkLoadingState());
    await _getPaymentLinkUseCase.execude(STCRechargeRequest(value: valueContoller.text)).then(
        (value) => value.fold((l) => emit(GetPaymentLinkErrorState(l.message)),
            (r) => emit(GetPaymentLinkSuccessState(r))));
  }

  Future collectMoney() async {
    emit(CollectMoneyLoadingState());
    await _collectMoneyUseCase.execude().then((value) => value.fold(
        (l) => emit(CollectMoneyErrorState(l.message)), (r) => emit(CollectMoneySuccessState(r))));
  }

  final TextEditingController valueContoller = TextEditingController();
  File? file;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future uploadImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        file = File(value.path);
        emit(UploadProfileImageSuccess());
      }
    });
  }
}
