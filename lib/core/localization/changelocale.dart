import 'package:nps/core/constant/apptheam.dart';
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData  appTheme= themeEnglish;

  changeLanguage(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

  }

  @override
  void onInit() {
    String? sharedLang = myServices.sharedPreferences.getString("lang");
    if (sharedLang == "ar") {
      language = const Locale("ar");
      appTheme=themeArabic;
    } else if (sharedLang == "en") {
      language = const Locale("en");
      appTheme=themeEnglish;
    } else {
      language =  Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
  }
}
