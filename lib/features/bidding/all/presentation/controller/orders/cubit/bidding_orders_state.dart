part of 'bidding_orders_cubit.dart';

sealed class BiddingOrdersState {
  const BiddingOrdersState();
}

final class BiddingOrdersOrdersInitial extends BiddingOrdersState {}

final class BiddingOrdersListInitial extends BiddingOrdersState {}

final class GetBiddingOrdersListLoadingState extends BiddingOrdersState {}

final class GetBiddingOrdersListPaginationLoadingState extends BiddingOrdersState {}

final class GetBiddingOrdersListSuccessState extends BiddingOrdersState {}

final class GetBiddingOrdersListErrorState extends BiddingOrdersState {
  final String error;
  const GetBiddingOrdersListErrorState(this.error);
}

final class BiddingOrdersListAllCaughtState extends BiddingOrdersState {}

final class BuyOrderAfterWinLoadingState extends BiddingOrdersState {}

final class BuyOrderAfterWinSuccessState extends BiddingOrdersState {}

final class BuyOrderAfterWinErrorState extends BiddingOrdersState {
  final String error;
  const BuyOrderAfterWinErrorState(this.error);
}

final class ConfirmBiddingOrderLoadingState extends BiddingOrdersState {}

final class ConfirmOrderSuccessState extends BiddingOrdersState {
  final bool isReject;
  ConfirmOrderSuccessState(this.isReject);
}

final class ConfirmOrderErrorState extends BiddingOrdersState {
  final String error;
  final bool isReject;

  const ConfirmOrderErrorState(this.error, this.isReject);
}

final class AuthConfirmOrderLoadingState extends BiddingOrdersState {}

final class AuthConfirmOrderSuccessState extends BiddingOrdersState {}

final class AuthConfirmOrderErrorState extends BiddingOrdersState {
  final String error;
  const AuthConfirmOrderErrorState(this.error);
}
