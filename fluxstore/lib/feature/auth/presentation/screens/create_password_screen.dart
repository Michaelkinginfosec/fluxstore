import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/utils/snackbar_helper.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_bloc.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_event.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_state.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/create_password_form.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/snackbar.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String? email;
  const CreatePasswordScreen({super.key, this.email});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  bool isFormFilled = false;
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
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
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
                child: BlocConsumer<AuthRemoteBloc, AuthRemoteState>(
                  listener: (context, state) {
                    if (state is AuthRemoteSuccess) {
                      CreatePasswordCustomSnackbar.show(
                        context,
                        state.message,
                        isError: false,
                      );
                    }
                    if (state is AuthRemoteFailure) {
                      CustomSnackbar.show(context, state.error, isError: true);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthRemoteLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return CustomContainer(
                      onTap: () {
                        if (_passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty) {
                          setState(() {
                            isFormFilled = false;
                          });
                          CustomSnackbar.show(
                            context,
                            "Please fill in all fields",
                            isError: true,
                          );
                          return;
                        }
                        if (_isPasswordVisible != _isConfirmPasswordVisible) {
                          CustomSnackbar.show(
                            context,
                            "Passwords do not match",
                            isError: true,
                          );
                          return;
                        }
                        //TODO: i will come back here to resolve why the create password snackbar not showing

                        context.read<AuthRemoteBloc>().add(
                          ResetPasswordEventRequested(
                            widget.email ?? '',
                            _passwordController.text.trim(),
                          ),
                        );
                      },
                      title: "Confirm",
                      style: AppStyle.primaryContainerStyle,
                      color:
                          isFormFilled
                              ? AppColors.secondaryContainerColor
                              : AppColors.primaryContainerColor,
                      width: 150,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
