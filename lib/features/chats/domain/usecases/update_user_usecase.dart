import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';

import '../../data/response/user_reponse.dart';
import '../repository/chat_repository.dart';

class UpdateUserUseCase {
  final ChatScreenRepository _chatScreenRepository;
  UpdateUserUseCase(
    this._chatScreenRepository,
  );

  Future<Either<Failure, dynamic>> execude(UserChatsResponse userModel) {
    return _chatScreenRepository.updateUser(userModel);
  }
}
