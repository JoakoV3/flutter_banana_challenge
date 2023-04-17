import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/views/views.dart';

class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //If user is logged in, return HomeScreen
    return const LoginScreen();
  }
}
