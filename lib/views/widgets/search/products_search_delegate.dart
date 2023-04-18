import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/viewModels/product_view_model.dart';
import 'package:flutter_banana_challenge/views/widgets/widgets.dart';
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
    return Consumer<ProductViewModel>(
      builder: (context, state, child) {
        if (state.searchResults.isEmpty) {
          return const Center(
            child: Text('No se encontraron resultados'),
          );
        }
        return ListView.builder(
          itemCount: state.searchResults.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = state.searchResults[index];
            return ProductSearchWidget(product: product);
          },
        );
      },
    );
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
        if (state.searchResults.isEmpty) {
          return const Center(
            child: Text('No se encontraron resultados'),
          );
        }
        return ListView.builder(
          itemCount: state.searchResults.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = state.searchResults[index];
            return ProductSearchWidget(product: product);
          },
        );
      },
    );
  }
}
