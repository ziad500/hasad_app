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
