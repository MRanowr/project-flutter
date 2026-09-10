import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  static const String _tokenKey = 'auth_token';
  static const String _emailKey = 'user_email';

  bool _isLoggedIn = false;
  bool _isLoading = true;
  String? _token;
  String _userEmail = '';

  bool get isLoggedIn => _isLoggedIn;
  bool get isAuthenticated => _isLoggedIn; // للحفاظ على التوافق مع الشاشات
  bool get isLoading => _isLoading;
  String? get token => _token;
  String get userEmail => _userEmail;

  AuthProvider() {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      _token = await _secureStorage.read(key: _tokenKey);
      _userEmail = await _secureStorage.read(key: _emailKey) ?? '';
      _isLoggedIn = _token != null && _token!.isNotEmpty;
    } catch (e) {
      _isLoggedIn = false;
      _userEmail = '';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // المحاكاة المؤقتة للاتصال
    await Future.delayed(const Duration(seconds: 1));

    if (email.isNotEmpty && password.length >= 6) {
      _token = "dummy_jwt_token_12345";
      _userEmail = email;

      await _secureStorage.write(key: _tokenKey, value: _token);
      await _secureStorage.write(key: _emailKey, value: _userEmail);

      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _emailKey);
    _token = null;
    _userEmail = '';
    _isLoggedIn = false;
    notifyListeners();
  }
}