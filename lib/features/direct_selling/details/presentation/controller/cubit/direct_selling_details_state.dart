part of 'direct_selling_details_cubit.dart';

sealed class DirectSellingDetailsState {
  const DirectSellingDetailsState();
}

final class DirectSellingDetailsInitial extends DirectSellingDetailsState {}

final class GetDirectSellingDetailsLoadingState extends DirectSellingDetailsState {}

final class GetDirectSellingDetailsSuccessState extends DirectSellingDetailsState {}

final class GetDirectSellingDetailsErrorState extends DirectSellingDetailsState {
  final String error;
  const GetDirectSellingDetailsErrorState(this.error);
}

final class ChangeIndexSliderstate extends DirectSellingDetailsState {}

final class BuyDirectSellingLoadingState extends DirectSellingDetailsState {}

final class BuyDirectSellingSuccessState extends DirectSellingDetailsState {
  final SuccessModel successModel;
  BuyDirectSellingSuccessState(this.successModel);
}

final class BuyDirectSellingErrorState extends DirectSellingDetailsState {
  final String error;
  const BuyDirectSellingErrorState(this.error);
}

final class EditCashBackLoadingState extends DirectSellingDetailsState {}

final class EditCashBackSuccessState extends DirectSellingDetailsState {
  String cashBack;
  EditCashBackSuccessState(this.cashBack);
}

final class EditCashBackErrorState extends DirectSellingDetailsState {
  final String error;
  const EditCashBackErrorState(this.error);
}
