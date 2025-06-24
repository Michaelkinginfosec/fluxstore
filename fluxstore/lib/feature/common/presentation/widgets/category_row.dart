import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/constants/category.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (i) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child:
                        selectedIndex == i
                            ? Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.selectedCategoryColor,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: AppColors.selectedCategoryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      categories[i]['icon'],
                                      fit: BoxFit.contain,
                                      color: AppColors.categoryIconColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.unSelectedCategoryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  categories[i]['icon'],
                                  fit: BoxFit.contain,
                                  color: AppColors.categoryIconColor,
                                ),
                              ),
                            ),
                  ),
                  AppSize.kHeight10,
                  Text(
                    categories[i]['title'],
                    style: AppStyle.selectedCategoryStyle,
                  ),
                ],
              );
            }),
          ),
          AppSize.kHeight20,
        ],
      ),
    );
  }
}
