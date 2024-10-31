import 'package:efash/features/cart/pages/widgets/cart_page.dart';
import 'package:efash/features/cart/pages/widgets/saved_page.dart';
import 'package:efash/features/products/pages/navbar.dart';
import 'package:efash/features/products/pages/products.dart';
import 'package:efash/features/products/pages/homescreen.dart';
import 'package:flutter/material.dart';

class EAppRoutes {
  //static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String homeScreen = '/homeScreen';

  static const String product = '/product';
  static const String cart = '/cart';
  static const String savedPage = '/savedPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case product:
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartPage());
      // case savedPage:
      //   return MaterialPageRoute(builder: (_) => const SavedPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
