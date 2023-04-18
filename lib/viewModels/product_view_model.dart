import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/product_model.dart';
import 'package:flutter_banana_challenge/services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService productService = ProductService();
  List<ProductModel> products = [];
  List<ProductModel> searchResults = [];
  bool loading = false;
  String query = '';
  Timer? debounce;

  Future<void> getProducts() async {
    loading = true;
    products = await productService.getProducts();
    loading = false;
    notifyListeners();
  }

  Future<void> searchProducts(String query) async {
    //Only search if the query is different
    if (this.query != query) {
      this.query = query;
      //Implement a debouncer so it doesn't search on every keystroke
      EasyDebounce.debounce(
        'searchProducts',
        const Duration(milliseconds: 500),
        () async {
          //Search products
          searchResults = await productService.searchProducts(query);
          notifyListeners();
        },
      );
    }
  }
}
