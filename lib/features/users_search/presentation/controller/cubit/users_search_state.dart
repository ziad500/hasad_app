part of 'users_search_cubit.dart';

sealed class UsersSearchState {
  const UsersSearchState();
}

final class UsersSearchInitial extends UsersSearchState {}

final class GetUsersLoadingState extends UsersSearchState {}

final class GetUsersSuccessState extends UsersSearchState {}

final class GetUsersErrorState extends UsersSearchState {
  final String error;
  GetUsersErrorState(this.error);
}

final class GetQrCodeSuccessState extends UsersSearchState {
  final String id;
  GetQrCodeSuccessState(this.id);
}
