import 'dart:math';

import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/features/products/models/product_return.dart';
import 'package:efash/features/products/pages/widgets/product_card.dart';
import 'package:efash/features/products/pages/widgets/product_detail.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final ProductReturn products;
  final bool isGrid;

  const ProductGrid({super.key, required this.products, this.isGrid = true});

  @override
  Widget build(BuildContext context) {
    final randomImage = images[Random().nextInt(images.length)];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final product = products.data[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    slug: product.slug,
                    image: randomImage,
                  ),
                ),
              );
            },
            child: ProductCard(
              product,
              isGrid: true,
            ),
          );
        },
      ),
    );
  }
}
