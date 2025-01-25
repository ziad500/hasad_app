part of 'bidding_requests_cubit.dart';

sealed class BiddingRequestsState {
  const BiddingRequestsState();
}

final class BiddingRequestsInitial extends BiddingRequestsState {}

final class GetBiddingRequestsListLoadingState extends BiddingRequestsState {}

final class GetBiddingRequestsListPaginationLoadingState extends BiddingRequestsState {}

final class GetBiddingRequestsListSuccessState extends BiddingRequestsState {}

final class GetBiddingRequestsListErrorState extends BiddingRequestsState {
  final String error;
  GetBiddingRequestsListErrorState(this.error);
}

final class BiddingRequestsListAllCaughtState extends BiddingRequestsState {}

final class GetAcceptOrRejectLoadingState extends BiddingRequestsState {}

final class GetAcceptOrRejectSuccessState extends BiddingRequestsState {}

final class GetAcceptOrRejectErrorState extends BiddingRequestsState {
  final String error;
  GetAcceptOrRejectErrorState(this.error);
}
