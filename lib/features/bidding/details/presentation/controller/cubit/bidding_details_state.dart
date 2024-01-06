part of 'bidding_details_cubit.dart';

sealed class BiddingDetailsState {
  const BiddingDetailsState();
}

final class BiddingDetailsInitial extends BiddingDetailsState {}

final class GetBiddingDetailsLoadingState extends BiddingDetailsState {}

final class GetBiddingDetailsSuccessState extends BiddingDetailsState {}

final class GetBiddingDetailsErrorState extends BiddingDetailsState {
  final String error;
  const GetBiddingDetailsErrorState(this.error);
}

final class ChangeIndexSliderstate extends BiddingDetailsState {}
