import 'package:efash/features/products/blocs/products/bloc.dart';
import 'package:efash/features/products/blocs/products/state.dart';
import 'package:efash/features/products/pages/widgets/productgrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return ProductGrid(products: state.products ); // This should be correct
        } else if (state is ProductError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox.shrink(); // Empty widget when no state matches
      },
    );
  }
}
