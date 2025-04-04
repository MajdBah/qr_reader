import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? languageCode = prefs.getString('languageCode');
      if (languageCode != null) {
        _locale = Locale(languageCode);
        notifyListeners();
      }
    } catch (e) {
      print('Error loading language: $e');
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale.languageCode == locale.languageCode) return;
    
    _locale = locale;
    notifyListeners();
    
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', locale.languageCode);
    } catch (e) {
      print('Error saving language: $e');
    }
  }
}
