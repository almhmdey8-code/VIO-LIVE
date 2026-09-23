import 'package:flutter/material.dart';

class VioLanguageService {
  static const List<Locale> اللغات_المدعومة = [
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
    Locale('tr'),
    Locale('fa'),
    Locale('ru'),
    Locale('zh'),
    Locale('ko'),
  ];

  static Locale اللغة_الحالية = const Locale('ar');

  static void تغيير_اللغة(Locale اللغة) {
    if (اللغات_المدعومة.any(
      (مدعومة) => مدعومة.languageCode == اللغة.languageCode,
    )) {
      اللغة_الحالية = اللغة;
    }
  }

  static bool هل_اللغة_مدعومة(Locale اللغة) {
    return اللغات_المدعومة.any(
      (مدعومة) => مدعومة.languageCode == اللغة.languageCode,
    );
  }

  static String اسم_اللغة(Locale اللغة) {
    switch (اللغة.languageCode) {
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'tr':
        return 'Türkçe';
      case 'fa':
        return 'فارسی';
      case 'ru':
        return 'Русский';
      case 'zh':
        return '中文';
      case 'ko':
        return '한국어';
      default:
        return 'العربية';
    }
  }
}
