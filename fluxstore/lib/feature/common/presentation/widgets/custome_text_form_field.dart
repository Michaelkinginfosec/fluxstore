import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

class CustomeTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffix;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomeTextFormField({
    super.key,
    required this.hintText,
    this.suffix,
    this.obscureText,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffix: suffix,
        hintText: hintText,
        hintStyle: AppStyle.secondaryStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.formBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.formBorderColor),
        ),
      ),
    );
  }
}
