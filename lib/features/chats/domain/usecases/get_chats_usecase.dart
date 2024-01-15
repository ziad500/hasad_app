import 'package:hasad_app/features/chats/domain/model/user_model.dart';

import '../repository/chat_repository.dart';

class GetChatsUseCase {
  final ChatScreenRepository _chatScreenRepository;
  GetChatsUseCase(
    this._chatScreenRepository,
  );

  Stream<List<UserChatModel>> execude(String userId) {
    return _chatScreenRepository.getChats(userId);
  }
}
