import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';

class OnboardContainer extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const OnboardContainer({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      left: 90,
      right: 90,
      child: CustomContainer(
        width: 140,
        color: AppColors.whiteWith25Opacity,
        onTap: onTap,
        title: title,
        style: AppStyle.primaryContainerStyle,
      ),
    );
  }
}
