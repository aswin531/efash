import 'package:efash/core/style/colors.dart';
import 'package:efash/features/cart/pages/shopping_page.dart';
import 'package:efash/features/watchlist/bloc/bloc.dart';
import 'package:efash/features/watchlist/bloc/event.dart';
import 'package:efash/features/watchlist/bloc/state.dart';
import 'package:efash/features/watchlist/pages/widgets/saved_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchListBloc>().add(FetchWatchList());
    return Scaffold(
      backgroundColor: EAppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: Colors.white,

        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              '2 items',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<WatchListBloc, WatchListStates>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchListLoaded) {
            final watchlistItems = state.items;

            if (watchlistItems.isEmpty) {
              return const Center(child: Text('Your watchlist is empty'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: watchlistItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = watchlistItems[index];
                return SavedItemCard(item: item,
                  name: item.name,
                  imageUrl: item.code,
                  originalPrice: item.oldPrice,
                  discountedPrice: item.price,
                  discount: "20% OFF",
                  size: "XL",
                  color: index == 0 ? "Beige" : "Grey",
                  id: item.id,
                );
              },
            );
          } else if (state is WatchListError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No items found'));
        },
      ),
    );
  }
}
