part of 'my_bidding_list_cubit.dart';

sealed class MyBiddingListState {
  const MyBiddingListState();
}

final class MyBiddingListInitial extends MyBiddingListState {}

final class MyGetBiddingListLoadingState extends MyBiddingListState {}

final class MyGetBiddingListPaginationLoadingState extends MyBiddingListState {}

final class MyGetBiddingListSuccessState extends MyBiddingListState {}

final class MyGetBiddingListErrorState extends MyBiddingListState {
  final String error;
  const MyGetBiddingListErrorState(this.error);
}

final class MyBiddingListAllCaughtState extends MyBiddingListState {}
