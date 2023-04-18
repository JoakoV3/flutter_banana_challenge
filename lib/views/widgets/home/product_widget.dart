import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/models/product_model.dart';
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(
      decimalDigits: 2,
      symbol: '\$',
    ).format(product.price);
    return Hero(
      tag: product.id,
      //Material is to solve the problem of the hero animation with red texts.
      child: Material(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product-detail',
              arguments: product),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(product.thumbnail),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        product.brand,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'USD$formattedPrice',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Stock: ${product.stock.toString()}",
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
