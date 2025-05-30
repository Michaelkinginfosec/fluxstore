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
}
