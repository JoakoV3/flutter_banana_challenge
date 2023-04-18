import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/product_model.dart';
import 'package:flutter_banana_challenge/services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService productService = ProductService();
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    products = await productService.getProducts();
    notifyListeners();
  }
}
