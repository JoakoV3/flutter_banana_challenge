import 'package:flutter/material.dart';

class TextFormLogin extends StatelessWidget {
  const TextFormLogin({
    super.key,
    required this.emailController,
    required this.hinText,
  });

  final TextEditingController emailController;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(hintText: hinText),
    );
  }
}
