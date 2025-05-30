import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/reset_password_field.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.kHeight30,
            Text("Forgot password?", style: AppStyle.primaryStyle),
            AppSize.kHeight30,
            Text(
              "Enter email associated with your account \nand we'll send an email with the instructions to \nreset your password",
              style: AppStyle.secondaryStyle,
            ),
            AppSize.kHeight50,
            ResetPasswordField(),
            AppSize.kHeight200,
            Align(
              alignment: Alignment.center,
              child: CustomContainer(
                onTap: () => context.push(AppRoutes.verification),
                width: 147,
                color: AppColors.primaryContainerColor,
                title: "Send Code",
                style: AppStyle.gemstoreSmallStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
