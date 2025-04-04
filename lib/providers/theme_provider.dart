import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? themeModeString = prefs.getString('themeMode');
      if (themeModeString != null) {
        _themeMode = ThemeMode.values.firstWhere(
          (element) => element.toString() == themeModeString,
          orElse: () => ThemeMode.system,
        );
        notifyListeners();
      }
    } catch (e) {
      print('Error loading theme: $e');
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('themeMode', mode.toString());
    } catch (e) {
      print('Error saving theme: $e');
    }
  }

  TextTheme getTextTheme(bool isArabic, Brightness brightness) {
    return isArabic
        ? GoogleFonts.cairoTextTheme(brightness == Brightness.light
            ? ThemeData.light().textTheme
            : ThemeData.dark().textTheme)
        : GoogleFonts.poppinsTextTheme(brightness == Brightness.light
            ? ThemeData.light().textTheme
            : ThemeData.dark().textTheme);
  }

  ThemeData getLightTheme(Locale locale) {
    final isArabic = locale.languageCode == 'ar';

    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2196F3),
        brightness: Brightness.light,
      ),
      textTheme: getTextTheme(isArabic, Brightness.light),
      fontFamily: isArabic
          ? GoogleFonts.cairo().fontFamily
          : GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 4,
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        enableFeedback: true,
      ),
    );
  }

  ThemeData getDarkTheme(Locale locale) {
    final isArabic = locale.languageCode == 'ar';

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2196F3),
        brightness: Brightness.dark,
      ),
      textTheme: getTextTheme(isArabic, Brightness.dark),
      fontFamily: isArabic
          ? GoogleFonts.cairo().fontFamily
          : GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 6,
        enableFeedback: true,
      ),
    );
  }
}
