import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/onboarding_data.dart';

class CustomDot extends StatelessWidget {
  final Color? color;
  final int currentPage;
  const CustomDot({super.key, this.color, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      top: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.backgroundColor),
              color:
                  currentPage == index
                      ? AppColors.backgroundColor
                      : Colors.transparent,

              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
