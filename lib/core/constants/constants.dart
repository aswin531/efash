import 'package:http/http.dart' as http;

class ApiConstants {
  static const home = "http://ecom2024.alisonsnewdemo.online/api/home";
  static const productpage =
      "http://ecom2024.alisonsnewdemo.online/api/product-details/en/test-12-430"; //(params -test-12-430(product slug))
  static const products =
      "http://ecom2024.alisonsnewdemo.online/api/products"; //(	by:categoryvalue:bags (category slug)

  static const baseUrl = "http://ecom2024.alisonsnewdemo.online/api/";

  static const refer =
      "https://docs.google.com/spreadsheets/d/1svSff-TAqBqtGA3pSveD974ph1oO3YxyZIC99_w7Wiw/edit?usp=sharing";
}

final http.Client httpClient = http.Client();
