import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/utils/cache_helper.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";

const String ASSET_PATH_LOCALIZATION = "assets/translations";

const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

class LanguageManager {
  static Future<Locale> getLocal() async {
    String currentLanguage = await LanguageManager.getAppLanguage();
    if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      return ENGLISH_LOCAL;
    } else {
      return ARABIC_LOCAL;
    }
  }

  static Future<void> changeAppLanguage(BuildContext context) async {
    /* String currentLanguage = await getAppLanguage(); */
    if (Constants.isArabic) {
      context.setLocale(ENGLISH_LOCAL);

      //  CacheHelper.saveData(key: "prefKeyLanguage", value: LanguageType.ENGLISH.getValue());
      Constants.isArabic = false;
    } else {
      context.setLocale(ARABIC_LOCAL);
      // CacheHelper.saveData(key: "prefKeyLanguage", value: LanguageType.ARABIC.getValue());
      Constants.isArabic = true;
    }
  }

  static Future<String> getAppLanguage() async {
    String? language = CacheHelper.getData(key: "prefKeyLanguage");
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
