import 'package:efash/core/style/colors.dart';
import 'package:efash/core/utils/appbar/custom_appbar_products.dart';
import 'package:efash/features/products/blocs/products/bloc.dart';
import 'package:efash/features/products/blocs/products/event.dart';
import 'package:efash/features/products/pages/widgets/product_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EAppColors.lightgrey,
      appBar: const CustomProductAppBar(),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(FetchProductDetails()),
        child: const ProductContent(),
      ),
    );
  }
}
