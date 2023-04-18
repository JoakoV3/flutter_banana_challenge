import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductsSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'Buscar Productos';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Implement search results page
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(Icons.search, size: 100, color: Colors.grey),
      );
    }

    final productsProvider = context.read<ProductViewModel>();

    return Consumer<ProductViewModel>(
      builder: (context, state, child) {
        productsProvider.searchProducts(query);
        return ListView.builder(
          itemCount: state.searchResults.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = state.searchResults[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.description),
            );
          },
        );
      },
    );
  }
}
