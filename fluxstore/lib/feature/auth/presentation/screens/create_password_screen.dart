import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/create_password_form.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:go_router/go_router.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.kHeight30,
              Text("Create a new password", style: AppStyle.primaryStyle),
              AppSize.kHeight20,
              Text(
                "Your new password must be different from  previously use password",
                style: AppStyle.secondaryStyle,
              ),
              AppSize.kHeight80,
              CreatePasswordForm(
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
              AppSize.kHeight100,
              Align(
                alignment: Alignment.center,
                child: CustomContainer(
                  onTap: () => context.go(AppRoutes.home),
                  title: "Confirm",
                  style: AppStyle.primaryContainerStyle,
                  color: AppColors.secondaryContainerColor,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
