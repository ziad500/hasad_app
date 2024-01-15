import 'dart:convert';

import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/utils/cache_helper.dart';

class DatabaseHelper {
  static String unSentKey = "unsent_messages";

  static Future<void> insertMessage(UserChatModel message) async {
    final List<String> messages =
        List<String>.from(CacheHelper.getData(key: unSentKey)?.cast<String>() ?? []);
    messages.add(jsonEncode(message.toJson()));
    CacheHelper.saveData(key: unSentKey, value: messages);
  }

  static List<UserChatModel> getUnsentMessages() {
    final List<String> messages =
        List<String>.from(CacheHelper.getData(key: unSentKey)?.cast<String>() ?? []);

    return messages.map((message) => UserChatModel.fromJson(jsonDecode(message))).toList();
  }

  static bool isMessageUnsent(UserChatModel model) {
    final List<String> messages =
        List<String>.from(CacheHelper.getData(key: unSentKey)?.cast<String>() ?? []);

    final List<UserChatModel> unsentMessages =
        messages.map((message) => UserChatModel.fromJson(jsonDecode(message))).toList();
    return unsentMessages.any((message) =>
        message.lastMessage == model.lastMessage &&
        message.userId == model.userId &&
        message.time == model.time &&
        message.created == null);
  }

  static Future<void> deleteMessage(UserChatModel message) async {
    final List<String> messages =
        List<String>.from(CacheHelper.getData(key: unSentKey)?.cast<String>() ?? []);

    messages.remove(jsonEncode(message.toJson()));
    CacheHelper.saveData(key: unSentKey, value: messages);
  }
}
