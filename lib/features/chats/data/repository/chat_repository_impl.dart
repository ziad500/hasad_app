import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/core/network_info.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import '../../domain/repository/chat_repository.dart';
import '../data_source/chat_screen_data_source.dart';
import '../response/user_reponse.dart';

class ChatScreenRepositoryImpl implements ChatScreenRepository {
  final ChatScreenRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  ChatScreenRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, dynamic>> makeMessageRead(
      MakeMessageReadRequest makeMessageReadRequest) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(Failure(networkCode, networkErrorMessage));
      }
      final respone = await _remoteDataSource.makeMessageRead(makeMessageReadRequest);
      return right(respone);
    } catch (e) {
      return left(Failure(0, e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateUser(UserChatsResponse userModel) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(Failure(networkCode, networkErrorMessage));
      }
      final respone = await _remoteDataSource.updateUser(userModel);
      return right(respone);
    } catch (e) {
      return left(Failure(0, e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addChat(SendMessageRequest sendMessageRequest) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(Failure(networkCode, networkErrorMessage));
      }
      final respone = await _remoteDataSource.addChat(sendMessageRequest);
      return right(respone);
    } catch (e) {
      return left(Failure(0, e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> saveMessage(SendMessageRequest sendMessageRequest) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(Failure(networkCode, networkErrorMessage));
      }
      final respone = await _remoteDataSource.saveMessage(sendMessageRequest);
      return right(respone);
    } catch (e) {
      return left(Failure(0, e.toString()));
    }
  }
}
