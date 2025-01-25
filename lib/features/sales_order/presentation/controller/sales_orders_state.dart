part of 'sales_orders_cubit.dart';

sealed class SalesOrdersState {
  const SalesOrdersState();
}

final class SalesOrdersInitial extends SalesOrdersState {}

final class GetSalesOrdersListLoadingState extends SalesOrdersState {}

final class GetSalesOrdersListPaginationLoadingState extends SalesOrdersState {}

final class GetSalesOrdersListSuccessState extends SalesOrdersState {}

final class GetSalesOrdersListErrorState extends SalesOrdersState {
  final String error;
  GetSalesOrdersListErrorState(this.error);
}

final class SalesOrdersListAllCaughtState extends SalesOrdersState {}
