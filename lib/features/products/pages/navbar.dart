import 'package:efash/core/utils/bottomnavbar/custom_navbar.dart';
import 'package:efash/features/cart/pages/shopping_page.dart';
import 'package:efash/features/products/blocs/cubit/navbarcubit.dart';
import 'package:efash/features/products/pages/products.dart';
import 'package:efash/features/products/pages/homescreen.dart';
import 'package:efash/features/watchlist/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 8, 6, 6),
    ));
    return BlocProvider(
      create: (context) => Navbarcubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<Navbarcubit, int>(
          builder: (context, selectedIndex) {
            return IndexedStack(
              index: selectedIndex,
              children: const [
                Homescreen(),
                ProductScreen(),
                WatchlistScreen(),
                CartScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
