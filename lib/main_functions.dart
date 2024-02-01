import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/firebase_options.dart';
import 'package:hasad_app/services/firebase_messaging_service.dart';
import 'package:hasad_app/services/local_notifications_service.dart';
import 'package:hasad_app/utils/bloc_observer.dart';
import 'package:hasad_app/utils/cache_helper.dart';
import 'package:hasad_app/utils/cache_keys.dart';
import 'core/di.dart' as di;

class APPInit {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseMessagingService.init();
    await LocalNotificationsService.init();
    await EasyLocalization.ensureInitialized();
    await CacheHelper.init();
    Bloc.observer = MyBlocObserver();
    await di.initAppModule();
    Constants.token = CacheHelper.getData(key: CacheKeys.token) ?? "";
    Constants.userId = CacheHelper.getData(key: CacheKeys.userId).toString();
  }
}
