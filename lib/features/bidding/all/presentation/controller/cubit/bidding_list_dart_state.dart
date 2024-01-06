part of 'bidding_list_dart_cubit.dart';

sealed class BiddingListState {
  const BiddingListState();
}

final class BiddingListDartInitial extends BiddingListState {}

final class GetBiddingListLoadingState extends BiddingListState {}

final class GetBiddingListPaginationLoadingState extends BiddingListState {}

final class GetBiddingListSuccessState extends BiddingListState {}

final class GetBiddingListErrorState extends BiddingListState {
  final String error;
  GetBiddingListErrorState(this.error);
}

final class BiddingListAllCaughtState extends BiddingListState {}

final class ResetState extends BiddingListState {}
