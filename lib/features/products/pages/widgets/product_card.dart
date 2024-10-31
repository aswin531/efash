import 'dart:math';
import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/core/style/colors.dart';
import 'package:efash/features/products/models/product_model.dart';
import 'package:efash/features/watchlist/bloc/bloc.dart';
import 'package:efash/features/watchlist/bloc/event.dart';
import 'package:efash/features/watchlist/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isGrid;

  const ProductCard(
    this.product, {
    super.key,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    final watchListBloc = BlocProvider.of<WatchListBloc>(context);

    // Check if the product is in the watchlist on initial build
    watchListBloc.add(CheckProductInWatchList(product.id));

    final randomImage = images[Random().nextInt(images.length)];

    return BlocConsumer<WatchListBloc, WatchListStates>(
      listener: (context, state) {
        if (state is WatchListError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is WatchlistOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        bool isFavorite = false;

        // Update favorite status based on bloc state
        if (state is WatchistProductStatus && state.productId == product.id) {
          isFavorite = state.isInWatchlist;
        }

        return SizedBox(
          width: isGrid ? null : 200,
          child: Card(
            color: EAppColors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: isGrid ? 150 : 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Image.asset(
                          randomImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline_sharp,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            if (isFavorite) {
                              watchListBloc
                                  .add(RemoveFromWatchList(product.id));
                            } else {
                              watchListBloc.add(AddToWatchList(product));
                            }
                            // Update the favorite status immediately after pressing
                            watchListBloc
                                .add(CheckProductInWatchList(product.id));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '£ ${product.price.toString()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
