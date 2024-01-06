part of 'direct_selling_list_dart_cubit.dart';

sealed class DirectSellingListDartState {
  const DirectSellingListDartState();
}

final class DirectSellingListDartInitial extends DirectSellingListDartState {}

final class GetDirectSellingListLoadingState extends DirectSellingListDartState {}

final class GetDirectSellingListPaginationLoadingState extends DirectSellingListDartState {}

final class GetDirectSellingListSuccessState extends DirectSellingListDartState {}

final class GetDirectSellingListErrorState extends DirectSellingListDartState {
  final String error;
  GetDirectSellingListErrorState(this.error);
}

final class DirectSellingListAllCaughtState extends DirectSellingListDartState {}
