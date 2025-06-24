import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custome_text_form_field.dart';

class CreatePasswordForm extends StatelessWidget {
  final Widget passwordSuffix;
  final Widget confirmPasswordSuffix;
  final bool passwordObscureText;
  final bool confirmPasswordObscureText;
  final void Function()? passwordTap;
  final void Function()? confirmPasswordTap;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  const CreatePasswordForm({
    super.key,
    required this.passwordSuffix,
    required this.confirmPasswordSuffix,
    required this.confirmPasswordObscureText,
    required this.passwordObscureText,
    this.passwordTap,
    this.confirmPasswordTap,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomeTextFormField(
            controller: passwordController,
            hintText: "Password",
            suffix: GestureDetector(onTap: passwordTap, child: passwordSuffix),
            obscureText: passwordObscureText,
          ),
          AppSize.kHeight20,
          CustomeTextFormField(
            controller: confirmPasswordController,
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
