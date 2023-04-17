import 'package:flutter/material.dart';

class TextFormLogin extends StatelessWidget {
  const TextFormLogin({
    super.key,
    required this.emailController,
    required this.hinText,
    this.obscure = false,
  });

  final TextEditingController emailController;
  final String hinText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      obscureText: obscure,
      decoration: InputDecoration(hintText: hinText),
    );
  }
}
