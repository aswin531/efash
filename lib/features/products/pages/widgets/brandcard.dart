import 'package:efash/core/constants/assets_constants.dart';
import 'package:efash/core/style/colors.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final int index;

  const BrandCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      EAppColors.primary.withOpacity(0.1),
                      EAppColors.primary.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  brandImagesBG[index],
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.1),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.0,
                    colors: [
                      EAppColors.transparent,
                      EAppColors.primary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
              Container(
                color: EAppColors.primaryLight,
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  brandImages[index],
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
