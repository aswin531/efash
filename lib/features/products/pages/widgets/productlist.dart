import 'dart:math';

import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/features/products/models/product_model.dart';
import 'package:efash/features/products/pages/widgets/product_card.dart';
import 'package:efash/features/products/pages/widgets/product_detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final bool isGrid;

  const ProductList({
    super.key, 
    required this.products, 
    this.isGrid = false
  });

  @override
  Widget build(BuildContext context) {
        final randomImage = images[Random().nextInt(images.length)];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(slug: products[index].slug,image:randomImage ,),
                  ),
                );
              },
              child: ProductCard(
                products[index],
                isGrid: false,
              ),
            ),
          );
        },
      ),
    );
  }
}