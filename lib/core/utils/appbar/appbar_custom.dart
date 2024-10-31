
import 'package:efash/core/style/colors.dart';
import 'package:efash/features/cart/pages/shopping_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: EAppColors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: EAppColors.black),
          onPressed: () {

          },
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


// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Function(String) onSearchChanged;

//   const CustomAppBar({super.key, required this.onSearchChanged});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: EAppColors.white,
//       elevation: 0,
//       title: TextField(
//         onChanged: onSearchChanged,
//         decoration: const InputDecoration(
//           hintText: 'Search products...',
//           hintStyle: TextStyle(color: EAppColors.grey),
//           border: InputBorder.none,
//         ),
//         style: const TextStyle(color: EAppColors.black),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.shopping_bag_outlined, color: EAppColors.black),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const CartScreen(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
