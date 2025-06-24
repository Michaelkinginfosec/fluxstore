import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custome_text_form_field.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  final Widget passwordSuffix;
  final bool passwordObscureText;
  final void Function()? passwordTap;
  final void Function()? onTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.passwordSuffix,
    required this.passwordObscureText,
    required this.passwordTap,
    required this.emailController,
    required this.passwordController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomeTextFormField(
            controller: emailController,
            hintText: "Email Address",
          ),
          AppSize.kHeight20,
          CustomeTextFormField(
            controller: passwordController,
            hintText: "Password",
            suffix: GestureDetector(onTap: passwordTap, child: passwordSuffix),
            obscureText: passwordObscureText,
          ),
          AppSize.kHeight20,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.push(AppRoutes.forgetpassword),
              child: Text("Forgot Password?"),
            ),
          ),
          AppSize.kHeight40,
          CustomContainer(
            onTap: onTap,
            width: 147,
            color: AppColors.primaryContainerColor,
            title: "LOGIN",
            style: AppStyle.gemstoreSmallStyle,
          ),
        ],
      ),
    );
  }
}
