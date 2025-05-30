import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(color: AppColors.backgroundColor)),
        Expanded(child: Container(color: AppColors.lightDark)),
      ],
    );
  }
}
