import 'package:flutter/services.dart';

class Constants {
  static const String baseUrl = "https://alhasad.sa/api/";
  static const String imagesUrl = "https://alhasad.sa/";
  static int limit = 5;
  static String userId = "";

  static String token = "";
  static String refreshToken = "";

  static bool isArabic = true;
  static const Duration apiTimeOut = Duration(milliseconds: 25000);

  static List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  static SystemUiOverlayStyle constSytemStatusBar = const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(0, 184, 38, 38), // <-- SEE HERE
    statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
    statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
  );
}
