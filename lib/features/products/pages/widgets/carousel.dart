import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/core/style/colors.dart';
import 'package:efash/features/products/blocs/carousel/event.dart';
import 'package:efash/features/products/blocs/carousel/state.dart';
import 'package:efash/features/products/pages/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/carousel/bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 470,
          height: 500,
          child: PageView.builder(
            onPageChanged: (int page) {
              context.read<CarouselBloc>().add(PageChangeEvent(page));
            },
            itemCount: carouselImages.length,
            itemBuilder: (context, index) {
              return WinterFashionCard(
                index: index,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(brandImagesBG.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: state.currentPage == index ? 16 : 8,
                    decoration: BoxDecoration(
                        color: state.currentPage == index
                            ? EAppColors.blue
                            : EAppColors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  );
                }));
          },
        )
      ],
    );
  }
}
