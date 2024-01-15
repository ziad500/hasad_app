import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/network_info.dart';
import 'package:hasad_app/features/chats/core/local_database_service.dart';
import 'package:hasad_app/features/chats/core/stream_service.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/domain/model/message_model.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/domain/usecases/add_chat_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/get_chats_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/get_messages_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/make_message_read_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/save_message_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/update_user_usecase.dart';
part 'chats_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final MakeMessageReadUseCase makeMessageReadUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final SaveMessageUseCase saveMessageUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final AddChatUseCase addChatUseCase;
  final NetworkInfo networkInfo;
  MessagesCubit(this.makeMessageReadUseCase, this.getMessagesUseCase, this.saveMessageUseCase,
      this.updateUserUseCase, this.addChatUseCase, this.networkInfo)
      : super(ChatsInitial());
  static MessagesCubit get(context) => BlocProvider.of(context);

  Future sendMessage(MessageResponse messageModel, UserChatsResponse recieverModel) async {
    //me
    addChat(SendMessageRequest(
        messageModel: MessageResponse(
            created: Timestamp.now(),
            recieverId: recieverModel.userId,
            senderId: Constants.userId,
            text: "Hello",
            time: Timestamp.now().toString()),
        recieverModel: UserChatsResponse(
            created: Timestamp.now(),
            image: null,
            isRead: true,
            lastMessage: messageModel.text,
            modified: Timestamp.now(),
            nameAr: "his name",
            nameEn: "his name",
            time: Timestamp.now().toString(),
            userId: recieverModel.userId),
        userId: Constants.userId));
    //his
    addChat(SendMessageRequest(
        messageModel: MessageResponse(
            created: Timestamp.now(),
            recieverId: Constants.userId,
            senderId: recieverModel.userId,
            text: "Hello",
            time: Timestamp.now().toString()),
        recieverModel: UserChatsResponse(
          created: Timestamp.now(),
          image: null,
          isRead: false,
          lastMessage: messageModel.text,
          modified: Timestamp.now(),
          nameAr: "my name",
          nameEn: "my name",
          time: Timestamp.now().toString(),
          userId: recieverModel.userId,
        ),
        userId: recieverModel.userId!));
    //me
    saveMessage(SendMessageRequest(
        messageModel: messageModel,
        recieverModel: UserChatsResponse(
            isRead: true,
            created: Timestamp.now(),
            modified: Timestamp.now(),
            image: recieverModel.image,
            lastMessage: recieverModel.lastMessage,
            nameAr: recieverModel.nameAr,
            nameEn: recieverModel.nameEn,
            userId: recieverModel.userId),
        userId: Constants.userId));
    //his
    saveMessage(SendMessageRequest(
        messageModel: messageModel,
        recieverModel: UserChatsResponse(
            isRead: false,
            created: Timestamp.now(),
            modified: Timestamp.now(),
            image: "My image",
            lastMessage: recieverModel.lastMessage,
            nameAr: "My name",
            nameEn: "My name",
            userId: Constants.userId),
        userId: recieverModel.userId!));
  }

  Future addChat(SendMessageRequest sendMessageRequest) async {
    emit(AddChatLoadingState());
    try {
      await addChatUseCase
          .execude(sendMessageRequest)
          .then((value) => value.fold((l) => emit(AddChatFaildState()), (r) => null));
    } catch (e) {
      emit(AddChatSuccessState());
    }
  }

  Future saveMessage(SendMessageRequest sendMessageRequest) async {
    emit(SaveMessageLoadingState());
    try {
      await saveMessageUseCase
          .execude(sendMessageRequest)
          .then((value) => value.fold((l) => emit(SaveMessageFaildState()), (r) => null));
    } catch (e) {
      emit(SaveMessageSuccessState());
    }
  }

  List<MessageModel> messages = [];

  StreamSubscription<List<MessageModel>> messagesStream(recieverId) {
    return getMessagesUseCase.execude(recieverId).listen((event) async {
      messages = [];
      for (var element in event) {
        messages.add(element);
      }
      if (await networkInfo.isConnected) {
        sendUnsentMessages();
      } else {
        final List<UserChatModel> unsentMessages = DatabaseHelper.getUnsentMessages()
            .where((element) => element.userId == recieverId)
            .toList();
        if (unsentMessages.isNotEmpty) {
          for (var element in unsentMessages) {
            messages.add(MessageModel(
                created: element.created,
                recieverId: element.userId,
                senderId: Constants.userId,
                time: element.time,
                text: element.lastMessage));
          }
        }
      }

      emit(GetMessagesSuccessState());
    });
  }

  StreamSubscription<List<MessageModel>>? messagesSubscription;

  // function to get chat messages
  void getMessages({required String recieverId, bool cancel = false}) {
    emit(GetMessagesLoadingState());

    try {
      if (messagesSubscription != null) {
        messagesSubscription!.cancel();
        messagesSubscription = null;
      }
      messagesSubscription = messagesStream(recieverId);
    } on SocketException catch (_) {
      emit(GetMessagesFaildState());
    } catch (_) {
      emit(GetMessagesFaildState());
    }
  }

  //check if message sent
  bool isUnSentMessage(recieverId, UserChatModel userChatModel) {
    return DatabaseHelper.isMessageUnsent(userChatModel);
  }

//sendUn sent messages
  void sendUnsentMessages() {
    final List<UserChatModel> unsentMessages = DatabaseHelper.getUnsentMessages();

    if (unsentMessages.isNotEmpty) {
      for (final UserChatModel message in unsentMessages) {
        // Send message using your message sending function
        /*   sendMessage(
            recieverModel: UserChatsResponse(
                created: message.created,
                image: message.image,
                isRead: message.isRead,
                lastMessage: message.lastMessage,
                modified: message.modified,
                nameAr: message.nameAr,
                nameEn: message.nameEn,
                title: message.title,
                userId: message.userId));
       */ // Delete message from local database
        DatabaseHelper.deleteMessage(message);
      }
      myStream.dispose();
    } else {
      myStream.dispose();
    }
  }

  final MyStream myStream = MyStream();
  StreamSubscription<bool>? subscription;

// send un sent messages
  bool isListening = false;
  void networkStream() async {
    myStream.start(() async {
      if (await networkInfo.isConnected) {
        sendUnsentMessages();
      }
    });
  }

  // function to make message read
  Future<void> makeMessageRead({required UserChatsResponse recieverModel, String? userId}) async {
    try {
      await makeMessageReadUseCase
          .execude(MakeMessageReadRequest(
              recieverModel: recieverModel, userId: userId ?? Constants.userId))
          .then((value) => value.fold((l) {}, (r) {}));
    } on SocketException catch (_) {
    } catch (_) {}
  }
}
