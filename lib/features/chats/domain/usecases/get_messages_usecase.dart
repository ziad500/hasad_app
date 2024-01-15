import 'package:hasad_app/features/chats/domain/model/message_model.dart';

import '../repository/chat_repository.dart';

class GetMessagesUseCase {
  final ChatScreenRepository _chatScreenRepository;
  GetMessagesUseCase(
    this._chatScreenRepository,
  );

  Stream<List<MessageModel>> execude(String recieverId) {
    return _chatScreenRepository.getMessages(recieverId);
  }
}
