import 'package:flutter/material.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custome_text_form_field.dart';

class LoginForm extends StatelessWidget {
  final Widget passwordSuffix;
  final bool passwordObscureText;
  final void Function()? passwordTap;
  const LoginForm({
    super.key,
    required this.passwordSuffix,
    required this.passwordObscureText,
    required this.passwordTap,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomeTextFormField(hintText: "Email Address"),
          AppSize.kHeight20,
          CustomeTextFormField(
            hintText: "Password",
            suffix: GestureDetector(onTap: passwordTap, child: passwordSuffix),
            obscureText: passwordObscureText,
          ),
        ],
      ),
    );
  }
}
