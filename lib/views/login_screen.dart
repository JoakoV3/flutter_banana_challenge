import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter_banana_challenge/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) async {
    final authViewModel = context.read<AuthViewModel>();
    final login = await authViewModel.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (!login && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¡Bienvenido al challenge para Banana!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Image(
              image: AssetImage('assets/images/banana.png'),
              width: 200,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormLogin(
                      emailController: emailController,
                      hinText: 'Usuario',
                    ),
                    TextFormLogin(
                      emailController: passwordController,
                      hinText: 'Contraseña',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () => handleLogin(context),
                      child: const Text('Ingresar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
