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

final class AuthConfirmOrderLoadingState extends DirectSellingOrdersState {}

final class AuthConfirmOrderSuccessState extends DirectSellingOrdersState {}

final class AuthConfirmOrderErrorState extends DirectSellingOrdersState {
  final String error;
  const AuthConfirmOrderErrorState(this.error);
}

final class ReCompleteOrderPaymentLoadingState extends DirectSellingOrdersState {}

final class ReCompleteOrderPaymentSuccessState extends DirectSellingOrdersState {}

final class ReCompleteOrderPaymentErrorState extends DirectSellingOrdersState {
  final String error;
  const ReCompleteOrderPaymentErrorState(this.error);
}

final class SelectPaymentMethodState extends DirectSellingOrdersState {}

final class SetPaymentMethodResultState extends DirectSellingOrdersState {}
