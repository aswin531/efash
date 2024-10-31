import 'package:efash/core/style/colors.dart';
import 'package:efash/features/cart/pages/shopping_page.dart';
import 'package:flutter/material.dart';

class CustomProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: EAppColors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, color: EAppColors.black),
          onPressed: () {},
        ),
        IconButton(
          icon:
              const Icon(Icons.shopping_bag_outlined, color: EAppColors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
