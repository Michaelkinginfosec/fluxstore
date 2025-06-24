import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_size.dart';

class TopCollection extends StatelessWidget {
  const TopCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Collection", style: AppStyle.featureProductText),
              Text("Show all", style: AppStyle.showAllText),
            ],
          ),
        ),
        AppSize.kHeight20,
        Image.asset("assets/images/top1.png"),
        Image.asset("assets/images/top2.png"),
        AppSize.kHeight20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/left.png",
                fit: BoxFit.contain,
                height: 194,
              ),
              Image.asset(
                "assets/images/right.png",
                fit: BoxFit.contain,
                height: 194,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
