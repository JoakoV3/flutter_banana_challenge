import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductSearchWidget extends StatelessWidget {
  const ProductSearchWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () => Navigator.pushNamed(
          context,
          'product-detail',
          arguments: product,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/loading.gif'),
              image: NetworkImage(product.thumbnail),
            ),
          ),
        ),
        title: Text(product.title),
        subtitle: Text(
          product.description,
          maxLines: 3,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
