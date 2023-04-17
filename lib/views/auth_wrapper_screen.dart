import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/user_model.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter_banana_challenge/views/views.dart';
import 'package:provider/provider.dart';

class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        if (authViewModel.user == UserModel.empty) {
          return const LoginScreen();
        }
        //If user is logged in, return HomeScreen
        return const HomeScreen();
      },
    );
  }
}
