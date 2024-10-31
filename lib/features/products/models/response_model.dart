// ignore_for_file: non_constant_identifier_names
import 'package:efash/features/products/models/banner_model.dart';
import 'package:efash/features/products/models/category_model.dart';
import 'package:efash/features/products/models/product_model.dart';

class ResponseModel {
  final int success;
  final String message;
  final List<Banner> banner1;
  final List<Product> best_seller;
  final List<Category> categories;

  ResponseModel(
      {required this.success,
      required this.message,
      required this.banner1,
      required this.best_seller,
      required this.categories});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'] ?? 5,
      message: json['message'] ?? 'No Message',
      banner1: json['banner1'] != null
          ? (json['banner1'] as List).map((i) => Banner.fromJson(i)).toList()
          : [],
      best_seller: json['best_seller'] != null
          ? (json['best_seller'] as List)
              .map((i) => Product.fromJson(i))
              .toList()
          : [], // Provide an empty list if null
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((i) => Category.fromJson(i))
              .toList()
          : [], // Provide an empty list if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'banner1': banner1.map((b) => b.toJson()).toList(),
      'best_seller': best_seller.map((p) => p.toJson()).toList(),
      'categories': categories.map((c) => c.toJson()).toList()
    };
  }
}
