import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';

class BrandImage extends StatelessWidget {
  const BrandImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/images/homeimage.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: Text(
            "Autumn\nCollection\n2025",
            style: AppStyle.imageTextStyle,
          ),
        ),
      ],
    );
  }
}
