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
