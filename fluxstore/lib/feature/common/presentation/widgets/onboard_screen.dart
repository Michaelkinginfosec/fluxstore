import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/onboarding_data.dart';

class OnboardScreen extends StatelessWidget {
  final void Function(int)? onPageChanged;
  final PageController? controller;
  const OnboardScreen({
    super.key,
    this.onPageChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      bottom: 140,
      child: PageView.builder(
        controller: controller,
        itemCount: onboardingData.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                onboardingData[index]['title']!,
                style: AppStyle.primaryStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                onboardingData[index]['subtitle']!,
                style: AppStyle.secondaryStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  onboardingData[index]['image']!,
                  height: 368,
                  width: 262,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
