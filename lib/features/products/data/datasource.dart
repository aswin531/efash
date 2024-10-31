// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:efash/core/constants/constants.dart';
import 'package:efash/core/constants/http_statuscode.dart';
import 'package:efash/features/products/models/product_detail_model.dart';
import 'package:efash/features/products/models/product_return.dart';
import 'package:efash/features/products/models/response_model.dart';
import 'package:http/http.dart' as http;

Future<ResponseModel> getHomeDetails() async {
  const String url = ApiConstants.home;

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == HttpStatusCodes.ok) {
      final responseData = json.decode(response.body);
      //print("RESPONSE :$responseData");
      return ResponseModel.fromJson(responseData);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception caught: $e');
    rethrow;
  }
}

Future<ProductDetailModel> getProductsByCategory(String categorySlug) async {
  String url =
      'http://ecom2024.alisonsnewdemo.online/api/product-details/en/$categorySlug';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'category': categorySlug}),
    );
    print(url);

    if (response.statusCode == HttpStatusCodes.ok) {
      final responseData = json.decode(response.body);
      print('RESPONSE : $responseData');
      return ProductDetailModel.fromJson(responseData);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception caught: $e');
    rethrow;
  }
}

Future<ProductsResponse> getProducts() async {
  const String url = ApiConstants.products;

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == HttpStatusCodes.ok) {
      final responseData = json.decode(response.body);
      print(responseData);
      return ProductsResponse.fromJson(responseData);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception caught: $e');
    rethrow;
  }
}
