import 'package:flutter/material.dart';

import '../models/language_model.dart';

//const seedColor = Color(0xFF6200EE);
//const seedColor = Color(0xFF4062DA);
const seedColor = Color.fromARGB(255, 16, 36, 164);
const double padding = 20;
const double avatarRadius = 45;

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: "🇺🇸",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "🇬🇧",
      languageName: 'English (UK)',
      countryCode: 'GB',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "🇫🇷",
      languageName: 'Français',
      countryCode: 'FR',
      languageCode: 'fr',
    ),
    LanguageModel(
      imageUrl: "🇮🇹",
      languageName: 'Italiano',
      countryCode: 'IT',
      languageCode: 'it',
    ),
    LanguageModel(
      imageUrl: "🇪🇸",
      languageName: 'Español',
      countryCode: 'ES',
      languageCode: 'es',
    ),
    LanguageModel(
      imageUrl: "🇩🇪",
      languageName: 'Deutsch',
      countryCode: 'DE',
      languageCode: 'de',
    ),
    LanguageModel(
      imageUrl: "🇨🇳",
      languageName: '中文',
      countryCode: 'CN',
      languageCode: 'zh',
    ),
    LanguageModel(
      imageUrl: "🇰🇷",
      languageName: '한국어',
      countryCode: 'KR',
      languageCode: 'ko',
    ),
    LanguageModel(
      imageUrl: "🇯🇵",
      languageName: '日本語',
      countryCode: 'JP',
      languageCode: 'ja',
    ),
    LanguageModel(
      imageUrl: "🇹🇭",
      languageName: 'ภาษาไทย',
      countryCode: 'TH',
      languageCode: 'th',
    ),
  ];

  /**
   * using flags from https://emojipedia.org/flags
   */
}
