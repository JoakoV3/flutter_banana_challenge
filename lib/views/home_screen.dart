import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Challenge 2023'),
        actions: [
          IconButton(
            onPressed: () {
              authViewModel.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
