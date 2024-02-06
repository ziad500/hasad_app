import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/network_info.dart';
import 'package:hasad_app/core/services/pick_files.dart';
import 'package:hasad_app/features/chats/core/local_database_service.dart';
import 'package:hasad_app/features/chats/core/stream_service.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/domain/usecases/add_chat_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/make_message_read_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/save_message_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/update_user_usecase.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/main.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final MakeMessageReadUseCase makeMessageReadUseCase;
  final SaveMessageUseCase saveMessageUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final AddChatUseCase addChatUseCase;
  final NetworkInfo networkInfo;
  MessagesCubit(this.makeMessageReadUseCase, this.saveMessageUseCase, this.updateUserUseCase,
      this.addChatUseCase, this.networkInfo)
      : super(ChatsInitial());
  static MessagesCubit get(context) => BlocProvider.of(context);
  final TextEditingController messageContoller = TextEditingController();

  Future sendMessage(MessageResponse messageModel, UserChatsResponse recieverModel) async {
    ProfileDataModel? myProfile = ProfileCubit.get(navigatorKey.currentContext).profileDataModel;

    if (myProfile == null) {
      await ProfileCubit.get(navigatorKey.currentContext).getProfileData();
      myProfile = ProfileCubit.get(navigatorKey.currentContext).profileDataModel;
    }
    //me
    addChat(SendMessageRequest(
        messageModel: MessageResponse(
            created: Timestamp.now(),
            recieverId: recieverModel.userId,
            senderId: Constants.userId,
            text: messageModel.text,
            time: Timestamp.now().toString()),
        recieverModel: UserChatsResponse(
            created: Timestamp.now(),
            image: recieverModel.image,
            isRead: true,
            lastMessage: messageModel.text,
            modified: Timestamp.now(),
            nameAr: recieverModel.nameEn,
            nameEn: recieverModel.nameEn,
            time: Timestamp.now().toString(),
            userId: recieverModel.userId),
        userId: Constants.userId));
    //his
    addChat(SendMessageRequest(
        messageModel: MessageResponse(
            created: Timestamp.now(),
            recieverId: Constants.userId,
            senderId: recieverModel.userId,
            text: messageModel.text,
            time: Timestamp.now().toString()),
        recieverModel: UserChatsResponse(
          created: Timestamp.now(),
          image: myProfile?.image,
          isRead: false,
          lastMessage: messageModel.text,
          modified: Timestamp.now(),
          nameAr: myProfile?.name,
          nameEn: myProfile?.name,
          time: Timestamp.now().toString(),
          userId: Constants.userId,
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
            lastMessage: messageModel.text,
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
            image: myProfile?.image,
            lastMessage: messageModel.text,
            nameAr: myProfile?.name,
            nameEn: myProfile?.name,
            userId: Constants.userId),
        userId: recieverModel.userId!));
  }

  Future addChat(SendMessageRequest sendMessageRequest) async {
    emit(AddChatLoadingState());
    await addChatUseCase.execude(sendMessageRequest).then((value) => value.fold((l) {
          emit(AddChatFaildState());
        }, (r) => emit(AddChatSuccessState())));
  }

  Future saveMessage(SendMessageRequest sendMessageRequest) async {
    emit(SaveMessageLoadingState());
    await saveMessageUseCase.execude(sendMessageRequest).then((value) =>
        value.fold((l) => emit(SaveMessageFaildState()), (r) => emit(SaveMessageSuccessState())));
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

  ////////////////////////////// upload file ///////////////////////////
  void uploadFile(MessageResponse messageModel, UserChatsResponse recieverModel) {
    emit(UploadFileLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("hasadImagesFirebase/${Uri.file(file!.path!).pathSegments.last}")
        .putFile(File(file!.path!))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        messageModel.text = value;
        sendMessage(messageModel, recieverModel);
        emit(UploadFileSuccessState());
      }).catchError((error) {
        emit(UploadFileFaildState());
      });
    }).catchError((error) {
      emit(UploadFileFaildState());
    });
  }

  PlatformFile? file;
// function to pick files
  Future<void> pickFiles({FileType fileType = FileType.custom}) async {
    try {
      await FilePickerService.pickFile(
        fileType: fileType,
        allowMultiple: false,
      ).then((value) {
        if (value != null) {
          file = value.files.first;
          emit(UploadImageSuccess(file: File(file!.path!)));
        }
      });
    } catch (e) {
      emit(UploadImageError());
    }
  }
}
