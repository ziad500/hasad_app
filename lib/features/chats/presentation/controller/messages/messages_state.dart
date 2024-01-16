part of 'messages_cubit.dart';

class MessagesState {}

final class ChatsInitial extends MessagesState {}

class ChatsScreenInitial extends MessagesState {}

class AddMessageLoadingState extends MessagesState {}

class AddMessageSuccessState extends MessagesState {}

class AddMessageFaildState extends MessagesState {}

class GetMessageLoadingState extends MessagesState {}

class AddUserSuccessState extends MessagesState {}

class AddUserFaildState extends MessagesState {}

class AddUserLoadingState extends MessagesState {}

class GetEmployeeLoadingState extends MessagesState {}

class GetEmployeeSuccessState extends MessagesState {}

class GetEmployeeErrorState extends MessagesState {}

class GetMessagesSuccessState extends MessagesState {}

class GetMessagesFaildState extends MessagesState {}

class GetMessagesLoadingState extends MessagesState {}

class EmitSuffix extends MessagesState {}

class AddUserToApiSuccessState extends MessagesState {}

class AddUserToApiFaildState extends MessagesState {}

class AddUserToApiLoadingState extends MessagesState {}

class GetChatsFromApiSuccessState extends MessagesState {}

class GetChatsFromApiFaildState extends MessagesState {}

class GetChatsFromApiLoadingState extends MessagesState {}

class InternetErrorState extends MessagesState {}

class SaveMessageLoadingState extends MessagesState {}

class SaveMessageSuccessState extends MessagesState {}

class SaveMessageFaildState extends MessagesState {}

class AddChatLoadingState extends MessagesState {}

class AddChatSuccessState extends MessagesState {}

class AddChatFaildState extends MessagesState {}

class UploadFileLoadingState extends MessagesState {}

class UploadFileSuccessState extends MessagesState {}

class UploadFileFaildState extends MessagesState {}

final class RemoveFilesState extends MessagesState {}

final class UploadImageSuccess extends MessagesState {
  final File? file;
  UploadImageSuccess({this.file});
}

final class UploadImageError extends MessagesState {}
