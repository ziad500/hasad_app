part of 'direct_selling_orders_cubit.dart';

sealed class DirectSellingOrdersState {
  const DirectSellingOrdersState();
}

final class DirectSellingOrdersOrdersInitial extends DirectSellingOrdersState {}

final class DirectSellingOrdersListInitial extends DirectSellingOrdersState {}

final class GetDirectSellingOrdersListLoadingState extends DirectSellingOrdersState {}

final class GetDirectSellingOrdersListPaginationLoadingState extends DirectSellingOrdersState {}

final class GetDirectSellingOrdersListSuccessState extends DirectSellingOrdersState {}

final class GetDirectSellingOrdersListErrorState extends DirectSellingOrdersState {
  final String error;
  const GetDirectSellingOrdersListErrorState(this.error);
}

final class DirectSellingOrdersListAllCaughtState extends DirectSellingOrdersState {}

final class ConfirmOrderLoadingState extends DirectSellingOrdersState {}

final class ConfirmOrderSuccessState extends DirectSellingOrdersState {}

final class ConfirmOrderErrorState extends DirectSellingOrdersState {
  final String error;
  const ConfirmOrderErrorState(this.error);
}
