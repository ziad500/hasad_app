import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import 'package:dartz/dartz.dart';
import '../repository/chat_repository.dart';

class AddChatUseCase {
  final ChatScreenRepository _chatScreenRepository;
  AddChatUseCase(
    this._chatScreenRepository,
  );

  Future<Either<Failure, dynamic>> execude(SendMessageRequest sendMessageRequest) {
    return _chatScreenRepository.addChat(sendMessageRequest);
  }
}
