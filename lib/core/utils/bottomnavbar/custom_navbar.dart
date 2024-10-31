import 'package:efash/core/style/colors.dart';
import 'package:efash/features/products/blocs/cubit/navbarcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Products"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded), label: "My Bag"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: "Saved Item"),
      ],
      currentIndex: context.watch<Navbarcubit>().state,
      selectedItemColor: EAppColors.blue,
      unselectedItemColor: EAppColors.grey,
      //backgroundColor: Color.fromARGB(255, 200, 22, 22),
      showUnselectedLabels: true,
      onTap: (index) {
        context.read<Navbarcubit>().selectTab(index);
      },
    );
  }
}
