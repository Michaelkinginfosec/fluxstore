import 'package:flutter/widgets.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

class AppStyle {
  static TextStyle gemstoreBigStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: AppColors.backgroundColor,
  );

  static TextStyle gemstoreSmallStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.backgroundColor,
  );
  static TextStyle primaryContainerStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: AppColors.backgroundColor,
  );
  static TextStyle primaryStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: AppColors.black,
  );
  static TextStyle secondaryStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static TextStyle signUpWith = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: AppColors.grey,
  );

  static TextStyle appBarTitleStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static TextStyle selectedCategoryStyle = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    color: AppColors.selectedCategoryColor,
  );
  static TextStyle unSelectedCategoryStyle = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    color: AppColors.unSelectedCategoryColor,
  );

  static TextStyle imageTextStyle = TextStyle(
    color: AppColors.backgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static TextStyle featureProductText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextStyle showAllText = TextStyle(
    color: Color.fromRGBO(155, 155, 155, 1),
    fontWeight: FontWeight.normal,
    fontSize: 13,
  );
  static TextStyle productTitleText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static TextStyle smallBoldText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static TextStyle productPriceText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}
