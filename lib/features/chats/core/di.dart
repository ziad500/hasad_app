import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/chats/data/data_source/chat_screen_data_source.dart';
import 'package:hasad_app/features/chats/data/firebase/firebase_service_client.dart';
import 'package:hasad_app/features/chats/data/repository/chat_repository_impl.dart';
import 'package:hasad_app/features/chats/domain/repository/chat_repository.dart';
import 'package:hasad_app/features/chats/domain/usecases/add_chat_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/get_chats_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/get_messages_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/make_message_read_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/save_message_usecase.dart';
import 'package:hasad_app/features/chats/domain/usecases/update_user_usecase.dart';
import 'package:hasad_app/features/chats/presentation/controller/chats/chats_cubit.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/chats_cubit.dart';

initChatsModule() {
  //remote data source instance
  if (!GetIt.I.isRegistered<ChatScreenRemoteDataSource>()) {
    sl.registerLazySingleton<ChatScreenRemoteDataSource>(
        () => ChatScreenRemoteDataSourceImpl(sl.call()));
  }
  if (!GetIt.I.isRegistered<FirebaseServiceClient>()) {
    sl.registerLazySingleton<FirebaseServiceClient>(() => FirebaseServiceClientImpl(sl.call()));
  }
  //use case
  if (!GetIt.I.isRegistered<GetMessagesUseCase>()) {
    sl.registerLazySingleton<GetMessagesUseCase>(() => GetMessagesUseCase(sl.call()));
  }
  if (GetIt.I.isRegistered<SaveMessageUseCase>()) {
    sl.unregister<SaveMessageUseCase>();
  }
  if (!GetIt.I.isRegistered<UpdateUserUseCase>()) {
    sl.registerFactory<UpdateUserUseCase>(() => UpdateUserUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<GetChatsUseCase>()) {
    sl.registerFactory<GetChatsUseCase>(() => GetChatsUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<GetMessagesUseCase>()) {
    sl.registerFactory<GetMessagesUseCase>(() => GetMessagesUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<AddChatUseCase>()) {
    sl.registerFactory<AddChatUseCase>(() => AddChatUseCase(sl.call()));
  }

  if (!GetIt.I.isRegistered<MakeMessageReadUseCase>()) {
    sl.registerFactory<MakeMessageReadUseCase>(() => MakeMessageReadUseCase(sl.call()));
  }
  if (!GetIt.I.isRegistered<SaveMessageUseCase>()) {
    sl.registerFactory<SaveMessageUseCase>(() => SaveMessageUseCase(sl.call()));
  }

  //repository instance
  if (!GetIt.I.isRegistered<ChatScreenRepository>()) {
    sl.registerLazySingleton<ChatScreenRepository>(
        () => ChatScreenRepositoryImpl(sl.call(), sl.call()));
  }

  //external

  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    final fireStore = FirebaseFirestore.instance;
    sl.registerLazySingleton(() => fireStore);
  }

  //cubit
  if (!GetIt.I.isRegistered<MessagesCubit>()) {
    sl.registerFactory<MessagesCubit>(
        () => MessagesCubit(sl.call(), sl.call(), sl.call(), sl.call(), sl.call(), sl.call()));
  }
  if (!GetIt.I.isRegistered<ChatsCubit>()) {
    sl.registerFactory<ChatsCubit>(() => ChatsCubit(sl.call()));
  }
}
