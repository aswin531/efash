import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/features/products/pages/widgets/brandcard.dart';
import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: brandImages.length,
        itemBuilder: (context, index) {
          return BrandCard(
            index: index,
          );
        },
      ),
    );
  }
}
