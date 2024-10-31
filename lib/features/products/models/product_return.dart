import 'package:efash/features/products/models/product_model.dart';

class ProductReturn {
  final int currentPage;
  final List<Product> data;

  ProductReturn({
    required this.currentPage,
    required this.data,
  });

  factory ProductReturn.fromJson(Map<String, dynamic> json) {
    return ProductReturn(
      currentPage: json['current_page'],
      data: List<Product>.from(json['data'].map((item) => Product.fromJson(item))),
    );
  }
}

class ProductsResponse {
  final bool success;
  final String message;
  final ProductReturn productReturn;

  ProductsResponse({
    required this.success,
    required this.message,
    required this.productReturn,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      success: json['success'] == 1,
      message: json['message'],
      productReturn: ProductReturn.fromJson(json['products']['return']),
    );
  }
}
