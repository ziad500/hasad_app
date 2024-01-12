part of 'favorites_cubit.dart';

sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesListDartInitial extends FavoritesState {}

final class GetFavoritesListLoadingState extends FavoritesState {}

final class GetFavoritesListPaginationLoadingState extends FavoritesState {}

final class GetFavoritesListSuccessState extends FavoritesState {}

final class GetFavoritesListErrorState extends FavoritesState {
  final String error;
  GetFavoritesListErrorState(this.error);
}

final class FavoritesListAllCaughtState extends FavoritesState {}

final class ResetState extends FavoritesState {}

final class AddToFavoritesListLoadingState extends FavoritesState {}

final class AddToFavoritesListSuccessState extends FavoritesState {}

final class AddToFavoritesListErrorState extends FavoritesState {
  final String error;
  AddToFavoritesListErrorState(this.error);
}
