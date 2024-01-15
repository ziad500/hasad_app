import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';

class SendMessageRequest {
  MessageResponse messageModel;
  UserChatsResponse recieverModel;
  String userId;
  SendMessageRequest({
    required this.messageModel,
    required this.recieverModel,
    required this.userId,
  });
}

class MakeMessageReadRequest {
  UserChatsResponse recieverModel;
  String userId;
  MakeMessageReadRequest({
    required this.recieverModel,
    required this.userId,
  });
}
