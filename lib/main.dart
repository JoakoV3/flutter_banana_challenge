import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xff9e007e),
          secondary: const Color(0xff9e007e),
        ),
      ),
      home: const AuthWrapperScreen(),
    );
  }
}
