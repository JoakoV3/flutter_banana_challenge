import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/user_model.dart';

import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService authService;

  AuthViewModel({required this.authService});

  UserModel _user = UserModel.empty;

  UserModel get user => _user;

  bool get isLoggedIn => _user != UserModel.empty;

  Future<bool> login(String email, String password) async {
    final user = await authService.login(email, password);
    if (user == UserModel.empty) return false;
    _user = user;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    await authService.logout();
    _user = UserModel.empty;
    notifyListeners();
  }

  Future<bool> checkAuthStatus() async {
    return await authService.isAuthenticated();
  }
}
