part of 'chats_cubit.dart';

sealed class ChatsState {
  const ChatsState();
}

final class ChatsInitial extends ChatsState {}

class GetChatsSuccessState extends ChatsState {}

class GetChatsFaildState extends ChatsState {}

class GetChatsLoadingState extends ChatsState {}
