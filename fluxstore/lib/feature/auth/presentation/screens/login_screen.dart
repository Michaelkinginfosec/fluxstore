import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/have_account.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/login_form.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/other_sign_in_method.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppSize.kHeight50,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log into\nyour account",
                    style: AppStyle.primaryStyle,
                  ),
                ),
                AppSize.kHeight30,
                LoginForm(
                  passwordObscureText: _isPasswordVisible,
                  passwordSuffix:
                      _isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                  passwordTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
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
                  width: 147,
                  color: AppColors.primaryContainerColor,
                  title: "LOGIN",
                  style: AppStyle.gemstoreSmallStyle,
                ),
                AppSize.kHeight20,
                Text("or log in with", style: AppStyle.signUpWith),
                AppSize.kHeight20,
                OtherSignInMethod(),
                AppSize.kHeight40,
                HaveAccount(
                  onTap: () => context.push(AppRoutes.signup),
                  title: "Don't have an account? ",
                  subTitle: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
