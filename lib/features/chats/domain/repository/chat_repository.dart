import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';

import '../../data/response/user_reponse.dart';
import '../model/message_model.dart';
import '../model/user_model.dart';

abstract class ChatScreenRepository {
  Future<Either<Failure, dynamic>> updateUser(UserChatsResponse userModel);
  Stream<List<MessageModel>> getMessages(String recieverId);
  Stream<List<UserChatModel>> getChats(String userId);
  Future<Either<Failure, dynamic>> makeMessageRead(MakeMessageReadRequest makeMessageReadRequest);
  //send message
  Future<Either<Failure, dynamic>> addChat(SendMessageRequest sendMessageRequest);
  Future<Either<Failure, dynamic>> saveMessage(SendMessageRequest sendMessageRequest);
}
