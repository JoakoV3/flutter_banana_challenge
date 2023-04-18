import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter_banana_challenge/views/views.dart';
import 'package:provider/provider.dart';

class AuthWrapperScreen extends StatefulWidget {
  const AuthWrapperScreen({Key? key}) : super(key: key);

  @override
  State<AuthWrapperScreen> createState() => _AuthWrapperScreenState();
}

class _AuthWrapperScreenState extends State<AuthWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        authViewModel.checkAuthStatus();
        if (authViewModel.token == '') {
          return const LoginScreen();
        }
        //If user is logged in, return HomeScreen
        return const HomeScreen();
      },
    );
  }
}
