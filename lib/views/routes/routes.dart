import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/views/views.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Product detail screen
  'product-detail': (BuildContext context) => const ProductDetailScreen(),
};
