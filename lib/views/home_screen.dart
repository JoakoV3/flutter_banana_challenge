import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter_banana_challenge/viewModels/product_view_model.dart';
import 'package:flutter_banana_challenge/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = context.read<AuthViewModel>();
    context.read<ProductViewModel>().getProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Challenge 2023'),
        leading: IconButton(
          onPressed: () {
            authViewModel.logout();
          },
          icon: const Icon(Icons.logout),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ProductsSearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Consumer<ProductViewModel>(
          builder: (context, state, child) {
            return ListView.builder(
              itemCount: state.products.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ProductModel product = state.products[index];
                return ProductWidget(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}
