import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/constants/product_data.dart';

class FeatureProduct extends StatelessWidget {
  const FeatureProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.kHeight20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Feature Products", style: AppStyle.featureProductText),
              Text("Show all", style: AppStyle.showAllText),
            ],
          ),
        ),
        AppSize.kHeight20,

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < femaleproducts.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        femaleproducts[i]['img'],
                        fit: BoxFit.contain,
                        height: 172,
                      ),
                      AppSize.kHeight10,
                      Text(
                        femaleproducts[i]['title'],
                        style: AppStyle.productTitleText,
                      ),
                      Text(
                        femaleproducts[i]['price'],
                        style: AppStyle.productPriceText,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        AppSize.kHeight20,
      ],
    );
  }
}
