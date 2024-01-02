part of 'add_request_cubit.dart';

sealed class AddRequestState {
  const AddRequestState();
}

final class AddRequestInitial extends AddRequestState {}

final class ChangePAgeViewIndexState extends AddRequestState {}
