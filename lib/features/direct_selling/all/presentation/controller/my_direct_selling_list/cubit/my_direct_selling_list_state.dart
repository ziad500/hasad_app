part of 'my_direct_selling_list_cubit.dart';

sealed class MyDirectSellingListState {
  const MyDirectSellingListState();
}

final class MyDirectSellingListInitial extends MyDirectSellingListState {}

final class MyGetDirectSellingListLoadingState extends MyDirectSellingListState {}

final class MyGetDirectSellingListPaginationLoadingState extends MyDirectSellingListState {}

final class MyGetDirectSellingListSuccessState extends MyDirectSellingListState {}

final class MyGetDirectSellingListErrorState extends MyDirectSellingListState {
  final String error;
  const MyGetDirectSellingListErrorState(this.error);
}

final class MyDirectSellingListAllCaughtState extends MyDirectSellingListState {}
