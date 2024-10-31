import 'package:efash/features/products/models/product_model.dart';
import 'package:efash/features/products/pages/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductSearch extends StatelessWidget {
  final List<Product> filteredProducts;

  const ProductSearch({super.key, required this.filteredProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ProductItem(product: filteredProducts[index]);
      },
    );
  }
}
