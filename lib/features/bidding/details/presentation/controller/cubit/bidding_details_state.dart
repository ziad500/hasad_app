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

final class BuyBiddingLoadingState extends BiddingDetailsState {}

final class BuyBiddingSuccessState extends BiddingDetailsState {
  final SuccessModel successModel;
  BuyBiddingSuccessState(this.successModel);
}

final class BuyBiddingErrorState extends BiddingDetailsState {
  final String error;
  const BuyBiddingErrorState(this.error);
}

final class BidBiddingLoadingState extends BiddingDetailsState {}

final class BidBiddingSuccessState extends BiddingDetailsState {
  final SuccessModel successModel;
  BidBiddingSuccessState(this.successModel);
}

final class BidBiddingErrorState extends BiddingDetailsState {
  final String error;
  const BidBiddingErrorState(this.error);
}

final class PayInsuranceBiddingLoadingState extends BiddingDetailsState {}

final class PayInsuranceBiddingSuccessState extends BiddingDetailsState {
  final SuccessModel successModel;
  PayInsuranceBiddingSuccessState(this.successModel);
}

final class PayInsuranceBiddingErrorState extends BiddingDetailsState {
  final String error;
  const PayInsuranceBiddingErrorState(this.error);
}

final class NewBidState extends BiddingDetailsState {}
