part of 'direct_selling_list_dart_cubit.dart';

sealed class DirectSellingListState {
  const DirectSellingListState();
}

final class DirectSellingListDartInitial extends DirectSellingListState {}

final class GetDirectSellingListLoadingState extends DirectSellingListState {}

final class GetDirectSellingListPaginationLoadingState extends DirectSellingListState {}

final class GetDirectSellingListSuccessState extends DirectSellingListState {}

final class GetDirectSellingListErrorState extends DirectSellingListState {
  final String error;
  GetDirectSellingListErrorState(this.error);
}

final class DirectSellingListAllCaughtState extends DirectSellingListState {}

final class ResetState extends DirectSellingListState {}
