part of 'wallet_cubit.dart';

sealed class WalletState {
  const WalletState();
}

final class WalletInitial extends WalletState {}

final class BankRechargLoadingState extends WalletState {}

final class BankRechargSuccessState extends WalletState {
  final SuccessModel successModel;
  BankRechargSuccessState(this.successModel);
}

final class BankRechargErrorState extends WalletState {
  final String error;
  BankRechargErrorState(this.error);
}

final class StcRechargLoadingState extends WalletState {}

final class StcRechargSuccessState extends WalletState {}

final class StcRechargErrorState extends WalletState {
  final String error;
  StcRechargErrorState(this.error);
}

final class GetPaymentLinkLoadingState extends WalletState {}

final class GetPaymentLinkSuccessState extends WalletState {
  final StchRechargeModel stchRechargeModel;
  GetPaymentLinkSuccessState(this.stchRechargeModel);
}

final class GetPaymentLinkErrorState extends WalletState {
  final String error;
  GetPaymentLinkErrorState(this.error);
}

final class UploadProfileImageSuccess extends WalletState {}

final class CollectMoneyLoadingState extends WalletState {}

final class CollectMoneySuccessState extends WalletState {
  final SuccessModel successModel;
  CollectMoneySuccessState(this.successModel);
}

final class CollectMoneyErrorState extends WalletState {
  final String error;
  CollectMoneyErrorState(this.error);
}
