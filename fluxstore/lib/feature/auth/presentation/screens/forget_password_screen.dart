import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/utils/snackbar_helper.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_bloc.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_event.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_state.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/reset_password_field.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
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
            ResetPasswordField(controller: emailController),
            AppSize.kHeight200,
            Align(
              alignment: Alignment.center,
              child: BlocConsumer<AuthRemoteBloc, AuthRemoteState>(
                listener: (context, state) {
                  if (state is AuthRemoteSuccess) {
                    CustomSnackbar.show(context, state.message);
                    context.push(
                      AppRoutes.verification,
                      extra: emailController.text,
                    );
                  } else if (state is AuthRemoteFailure) {
                    CustomSnackbar.show(context, state.error, isError: true);
                  }
                },
                builder: (context, state) {
                  return CustomContainer(
                    onTap: () {
                      if (emailController.text.isEmpty) {
                        CustomSnackbar.show(
                          context,
                          "Please enter your email",
                          isError: true,
                        );
                      }
                      context.read<AuthRemoteBloc>().add(
                        ForgotPasswordEventRequested(emailController.text),
                      );
                    },

                    width: 147,
                    color: AppColors.primaryContainerColor,
                    title: "Send Code",
                    style: AppStyle.gemstoreSmallStyle,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
