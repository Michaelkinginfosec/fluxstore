import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/sign_up_form.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/have_account.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/other_sign_in_method.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                    "Create\nyour account",
                    style: AppStyle.primaryStyle,
                  ),
                ),
                AppSize.kHeight30,
                SignUpForm(
                  fullNameController: _fullNameController,
                  passwordController: _passwordController,
                  emailController: _emailController,
                  confirmPasswordObscureText: _isConfirmPasswordVisible,
                  confirmPasswordSuffix:
                      _isConfirmPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                  confirmPasswordTap: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
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
                AppSize.kHeight40,
                AppSize.kHeight20,
                Text("or sign up with", style: AppStyle.signUpWith),
                AppSize.kHeight20,
                OtherSignInMethod(),
                AppSize.kHeight40,
                HaveAccount(
                  onTap: () => context.push(AppRoutes.login),
                  title: "Already have an account? ",
                  subTitle: "Log In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
