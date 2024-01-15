import 'package:hasad_app/features/chats/data/firebase/firebase_service_client.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import '../response/user_reponse.dart';

abstract class ChatScreenRemoteDataSource {
  Future<dynamic> updateUser(UserChatsResponse userModel);

  Future<dynamic> makeMessageRead(MakeMessageReadRequest makeMessageReadRequest);

  //send Message
  Future<dynamic> addChat(SendMessageRequest sendMessageRequest);
  Future<dynamic> saveMessage(SendMessageRequest sendMessageRequest);
}

class ChatScreenRemoteDataSourceImpl implements ChatScreenRemoteDataSource {
  final FirebaseServiceClient _firebaseServiceClient;

  ChatScreenRemoteDataSourceImpl(this._firebaseServiceClient);

  @override
  Future addChat(SendMessageRequest sendMessageRequest) =>
      _firebaseServiceClient.addChat(sendMessageRequest);

  @override
  Future saveMessage(SendMessageRequest sendMessageRequest) =>
      _firebaseServiceClient.saveMessage(sendMessageRequest);

  @override
  Future updateUser(UserChatsResponse userModel) => _firebaseServiceClient.updateUser(userModel);

  @override
  Future makeMessageRead(MakeMessageReadRequest makeMessageReadRequest) =>
      _firebaseServiceClient.makeMessageRead(makeMessageReadRequest);
}
