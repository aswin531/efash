import 'package:efash/features/products/models/product_model.dart';
import 'package:flutter/material.dart';

// class ProductI {
//   final String name;
//   final double price;
//   final String imageUrl;

//   ProductI({required this.name, required this.price, required this.imageUrl});
// }

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Image.network(product.imageUrl),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
    );
  }
}
