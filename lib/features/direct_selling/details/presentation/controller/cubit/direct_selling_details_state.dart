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
