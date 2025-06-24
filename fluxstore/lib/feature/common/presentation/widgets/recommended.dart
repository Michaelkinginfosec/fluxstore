import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended", style: AppStyle.featureProductText),
              Text("Show all", style: AppStyle.showAllText),
            ],
          ),
        ),
        AppSize.kHeight20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 213,

                  decoration: BoxDecoration(color: AppColors.recommendedColor),
                  child: Row(
                    children: [
                      Image.asset('assets/images/recommended1.png'),
                      AppSize.kWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "White fashion hoodie",
                            style: AppStyle.productTitleText,
                          ),
                          Text("\$ 20.00", style: AppStyle.productPriceText),
                        ],
                      ),
                    ],
                  ),
                ),
                AppSize.kWidth20,
                Container(
                  width: 213,

                  decoration: BoxDecoration(color: AppColors.recommendedColor),
                  child: Row(
                    children: [
                      Image.asset('assets/images/recommended2.png'),
                      AppSize.kWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "White fashion hoodie",
                            style: AppStyle.productTitleText,
                          ),
                          Text("\$ 30.00", style: AppStyle.productPriceText),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        AppSize.kHeight20,
      ],
    );
  }
}
