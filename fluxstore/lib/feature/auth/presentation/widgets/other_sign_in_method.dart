import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_size.dart';

class OtherSignInMethod extends StatelessWidget {
  const OtherSignInMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.asset('assets/images/apple.png', height: 35),
        AppSize.kWidth20,
        Image.asset('assets/images/google.png', height: 35),
        AppSize.kWidth20,
        Image.asset('assets/images/facebook.png', height: 35),
      ],
    );
  }
}
