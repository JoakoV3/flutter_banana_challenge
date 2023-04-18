import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/constants/constants.dart';
import 'package:flutter_banana_challenge/viewModels/product_view_model.dart';
import 'package:flutter_banana_challenge/views/routes/routes.dart';
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
        ChangeNotifierProvider<ProductViewModel>(
            create: (context) => ProductViewModel()),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(authService: authService),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banana Challenge',
        routes: routes,
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: primaryColor,
          ),
        ),
        home: const AuthWrapperScreen(),
      ),
    );
  }
}
