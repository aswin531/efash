import 'package:efash/core/style/colors.dart';
import 'package:efash/core/utils/appbar/appbar_custom.dart';
import 'package:efash/core/utils/widgets/loadingtxt_widget.dart';
import 'package:efash/features/products/blocs/home/bloc.dart';
import 'package:efash/features/products/blocs/home/event.dart';
import 'package:efash/features/products/blocs/home/states.dart';
import 'package:efash/features/products/pages/products.dart';
import 'package:efash/features/products/pages/widgets/brandllist.dart';
import 'package:efash/features/products/pages/widgets/carousel.dart';
import 'package:efash/features/products/pages/widgets/productlist.dart';
import 'package:efash/features/products/pages/widgets/sectionheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FetchHomeDetails());

    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoading) {
          const LoadingtxtWidget();
        } else if (state is HomeLoaded) {
          return Scaffold(
            backgroundColor: EAppColors.lightgrey,
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandList(),
                  const CarouselWidget(),
                  SectionHeader(
                    title: 'Our Products',
                    actionText: 'Explore All',
                    onActionPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ));
                    },
                  ),
                  ProductList(
                    products: state.responseModel.best_seller,
                  ),
                ],
              ),
            ),
          );
        } else if (state is HomeError) {
          // print(state.error.toString());
          return Center(child: Text('Error: ${state.error}}'));
        }
        return const Center(child: Scaffold(body: Text('Loading....')));
      },
    );
  }
}
