import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/domain/usecases/get_chats_usecase.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final GetChatsUseCase getChatsUseCase;
  ChatsCubit(this.getChatsUseCase) : super(ChatsInitial());
  static ChatsCubit get(context) => BlocProvider.of(context);

  List<UserChatModel> chats = [];

  StreamSubscription<List<UserChatModel>> chatsStream(userId) {
    return getChatsUseCase.execude(userId).listen((event) {
      chats = [];
      for (var element in event) {
        chats.add(element);
      }
      emit(GetChatsSuccessState());
    });
  }

  StreamSubscription<List<UserChatModel>>? chatsSubscription;

  // function to get chats
  void getChats({required String userId, bool cancel = false}) {
    emit(GetChatsLoadingState());
    try {
      if (chatsSubscription != null) {
        chatsSubscription!.cancel();
        chatsSubscription = null;
      }
      chatsSubscription = chatsStream(userId);
    } on SocketException catch (_) {
      emit(GetChatsFaildState());
    } catch (_) {
      emit(GetChatsFaildState());
    }
  }
}
