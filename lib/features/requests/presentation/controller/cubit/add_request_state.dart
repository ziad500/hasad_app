part of 'add_request_cubit.dart';

sealed class AddRequestState {
  const AddRequestState();
}

final class AddRequestInitial extends AddRequestState {}

final class ChangePAgeViewIndexState extends AddRequestState {}

final class SelectTypeState extends AddRequestState {}

final class SelectDepartmentState extends AddRequestState {}

final class SelectTypeOfProductState extends AddRequestState {}

final class SelectPriceIncludingState extends AddRequestState {}

final class SelectAgricultureState extends AddRequestState {}

final class SelectPackagingState extends AddRequestState {}

final class SelectHarvestDateState extends AddRequestState {}

final class SelectBiddingDateState extends AddRequestState {}
