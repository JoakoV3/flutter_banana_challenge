import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_banana_challenge/services/auth_service.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter_banana_challenge/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(authService: authService),
        )
      ],
      child: MaterialApp(
        title: 'Banana Challenge',
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xff9e007e),
            secondary: const Color(0xff9e007e),
          ),
        ),
        home: const AuthWrapperScreen(),
      ),
    );
  }
}
