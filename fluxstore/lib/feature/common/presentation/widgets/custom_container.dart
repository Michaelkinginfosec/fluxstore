import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final void Function()? onTap;
  final double width;
  final Color color;
  const CustomContainer({
    super.key,
    required this.title,
    this.onTap,
    required this.style,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width, //193,
        height: 53,
        decoration: BoxDecoration(
          color: color, //AppColors.whiteWith25Opacity,
          border: Border.all(width: 1, color: AppColors.backgroundColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(child: Text(title, style: style)),
      ),
    );
  }
}
