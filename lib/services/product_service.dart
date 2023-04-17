import 'package:flutter_banana_challenge/constants/constants.dart';

import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('$url/products');
      final List<ProductModel> products = response.data;
      return products;
    } catch (e) {
      return [];
    }
  }
}
