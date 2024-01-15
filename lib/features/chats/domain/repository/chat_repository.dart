import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';

import '../../data/response/user_reponse.dart';

abstract class ChatScreenRepository {
  Future<Either<Failure, dynamic>> updateUser(UserChatsResponse userModel);
  Future<Either<Failure, dynamic>> makeMessageRead(MakeMessageReadRequest makeMessageReadRequest);
  //send message
  Future<Either<Failure, dynamic>> addChat(SendMessageRequest sendMessageRequest);
  Future<Either<Failure, dynamic>> saveMessage(SendMessageRequest sendMessageRequest);
}
