import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custome_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Widget passwordSuffix;
  final Widget confirmPasswordSuffix;
  final bool passwordObscureText;
  final bool confirmPasswordObscureText;
  final void Function()? passwordTap;
  final void Function()? confirmPasswordTap;

  const SignUpForm({
    super.key,
    required this.passwordSuffix,
    required this.confirmPasswordSuffix,
    required this.confirmPasswordObscureText,
    required this.passwordObscureText,
    this.passwordTap,
    this.confirmPasswordTap,
    //controllers
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomeTextFormField(
            hintText: "Enter your name",
            controller: fullNameController,
          ),
          AppSize.kHeight20,
          CustomeTextFormField(
            hintText: "Email Address",
            controller: emailController,
          ),
          AppSize.kHeight20,
          CustomeTextFormField(
            hintText: "Password",
            suffix: GestureDetector(onTap: passwordTap, child: passwordSuffix),
            obscureText: passwordObscureText,
          ),
          AppSize.kHeight20,
          CustomeTextFormField(
            controller: passwordController,
            hintText: "Confirm Password",
            suffix: GestureDetector(
              onTap: confirmPasswordTap,
              child: confirmPasswordSuffix,
            ),
            obscureText: confirmPasswordObscureText,
          ),
        ],
      ),
    );
  }
}
