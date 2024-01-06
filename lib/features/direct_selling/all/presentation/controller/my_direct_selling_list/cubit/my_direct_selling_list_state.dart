part of 'my_direct_selling_list_cubit.dart';

sealed class MyDirectSellingListState extends Equatable {
  const MyDirectSellingListState();

  @override
  List<Object> get props => [];
}

final class MyDirectSellingListInitial extends MyDirectSellingListState {}

final class MyGetDirectSellingListLoadingState extends MyDirectSellingListState {}

final class MyGetDirectSellingListPaginationLoadingState extends MyDirectSellingListState {}

final class MyGetDirectSellingListSuccessState extends MyDirectSellingListState {}

final class MyGetDirectSellingListErrorState extends MyDirectSellingListState {
  final String error;
  MyGetDirectSellingListErrorState(this.error);
}

final class MyDirectSellingListAllCaughtState extends MyDirectSellingListState {}
