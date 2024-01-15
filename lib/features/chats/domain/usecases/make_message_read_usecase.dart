import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import 'package:dartz/dartz.dart';

import '../repository/chat_repository.dart';

class MakeMessageReadUseCase {
  final ChatScreenRepository _chatScreenRepository;
  MakeMessageReadUseCase(
    this._chatScreenRepository,
  );

  Future<Either<Failure, dynamic>> execude(MakeMessageReadRequest makeMessageReadRequest) {
    return _chatScreenRepository.makeMessageRead(makeMessageReadRequest);
  }
}
