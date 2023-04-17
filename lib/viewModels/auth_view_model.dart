import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/user_model.dart';

import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService authService;

  AuthViewModel({required this.authService});

  UserModel _user = UserModel.empty;

  UserModel get user => _user;

  bool get isLoggedIn => _user != UserModel.empty;

  Future<void> login(String email, String password) async {
    final user = await authService.login(email, password);
    _user = user;
    notifyListeners();
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
