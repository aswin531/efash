import 'package:efash/core/style/colors.dart';
import 'package:efash/features/cart/blocs/bloc.dart';
import 'package:efash/features/cart/blocs/event.dart';
import 'package:efash/features/cart/blocs/state.dart';
import 'package:efash/features/cart/pages/widgets/cart_footer.dart';
import 'package:efash/features/cart/pages/widgets/cart_item.dart';
import 'package:efash/features/watchlist/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(FetchCartItemEvent());

    return Scaffold(
      backgroundColor: EAppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WatchlistScreen(),
                    ));
              },
            ),
          ),
        ],
        title: const Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartItems = state.items;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItem(
                        id: item.id,
                        name: item.name,
                        imageUrl: item.image,
                        originalPrice: item.oldPrice,
                        discountedPrice: item.price,
                        discount: "${item.price}% OFF",
                        size: item.code,
                        color: item.code,
                        quantity: item.cart,
                        onDelete: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveFromCartEvent(item.id));
                        },
                      );
                    },
                  ),
                ),
                const CartFooter(),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
