import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banana_challenge/constants/constants.dart';

import '../../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //The endpoint /products/{id} does not have additional information.
    //So I am using the same product to display the product detail.
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _ProductAppBar(product: product),
          SliverList(
              delegate:
                  SliverChildListDelegate([_ProductBody(product: product)])),
        ],
      ),
    );
  }
}

class _ProductAppBar extends StatelessWidget {
  const _ProductAppBar({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(product.title, style: const TextStyle(fontSize: 15)),
        background: Hero(
          tag: product.id,
          //Material is to solve the problem of the hero animation with red texts.
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: [
                FadeInImage(
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductBody extends StatelessWidget {
  const _ProductBody({
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "USD\$${product.price.toString()}",
                style: const TextStyle(
                    color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
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
          CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: product.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      image: NetworkImage(image),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              width: size.width * 0.85,
              child: Column(
                children: [
                  Text(product.description),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700]),
                          Text(product.rating.toString())
                        ],
                      ),
                      Text("Stock: ${product.stock}")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
