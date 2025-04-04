import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationService {
  final Locale locale;
  Map<String, String> _localizedStrings = {};

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];

  LocalizationService(this.locale);

  static LocalizationService of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService)!;
  }

  static const LocalizationsDelegate<LocalizationService> delegate = _LocalizationServiceDelegate();

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static String getLangName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      default:
        return 'English';
    }
  }
}

class _LocalizationServiceDelegate extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService localizations = LocalizationService(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_LocalizationServiceDelegate old) => false;
}
