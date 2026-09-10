import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _langKey = 'language_code';
  Locale _locale = const Locale('ar');

  Locale get locale => _locale;

  LanguageProvider() {
    _loadLanguageFromPrefs();
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_locale.languageCode == languageCode) return;
    _locale = Locale(languageCode);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langKey, languageCode);
  }

  Future<void> _loadLanguageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_langKey) ?? 'ar';
    _locale = Locale(langCode);
    notifyListeners();
  }
}