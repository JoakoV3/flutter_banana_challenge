import 'dart:developer';

import 'package:flutter_banana_challenge/constants/constants.dart';

import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('$url/products');
      final List products = response.data['products'] as List;
      final List<ProductModel> prods =
          products.map((prod) => ProductModel.fromJson(prod)).toList();
      return prods;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
