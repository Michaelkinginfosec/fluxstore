import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_size.dart';

class Hangout extends StatelessWidget {
  const Hangout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/images/hangoutimage.png',
            fit: BoxFit.contain,
          ),
        ),
        AppSize.kHeight20,
      ],
    );
  }
}
