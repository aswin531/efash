import 'package:efash/core/style/colors.dart';
import 'package:efash/core/utils/appbar/appbar_custom.dart';
import 'package:efash/features/cart/pages/widgets/checkout_section.dart';
import 'package:efash/features/products/blocs/home/bloc.dart';
import 'package:efash/features/products/blocs/home/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final homeBloc = context.read<HomeBloc>();

    return Scaffold(backgroundColor: EAppColors.white,
            appBar:  const CustomAppBar(
        //        onSearchChanged: (query) {
        //   if (query.isNotEmpty) {
        //     homeBloc.add(SearchProducts(query));
        //   } else {
        //     homeBloc.add(FetchHomeDetails());
        //   }
        // },
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/thanks.png'),
          const CheckoutSection()
        ],
      ),
    );
  }
}
