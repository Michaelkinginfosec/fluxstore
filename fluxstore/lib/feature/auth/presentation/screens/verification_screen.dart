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
import 'package:fluxstore/feature/auth/presentation/widgets/otp_count_down_timer.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/otp_input_field.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<OtpInputFieldState> _otpKey = GlobalKey<OtpInputFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.kHeight30,
              Text("Verification Code", style: AppStyle.primaryStyle),
              AppSize.kHeight10,
              Text(
                "Please enter the verification code we sent \nto your email",
                style: AppStyle.secondaryStyle,
              ),
              AppSize.kHeight50,
              OtpInputField(
                key: _otpKey,
                length: 4,
                width: 58,
                height: 58,
                borderRadius: BorderRadius.circular(50),
              ),

              OtpCountdownTimer(
                onResend: () {
                  context.read<AuthRemoteBloc>().add(
                    ForgotPasswordEventRequested(widget.email),
                  );
                },
              ),
              AppSize.kHeight150,
              Align(
                alignment: Alignment.center,
                child: BlocConsumer<AuthRemoteBloc, AuthRemoteState>(
                  listener: (context, state) {
                    if (state is AuthRemoteSuccess) {
                      CustomSnackbar.show(context, state.message);
                      context.push(
                        AppRoutes.createpassword,
                        extra: widget.email,
                      );
                    } else if (state is AuthRemoteFailure) {
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
                        if (_otpKey.currentState?.getOtpValue().isEmpty ??
                            true) {
                          CustomSnackbar.show(
                            context,
                            "Please enter the OTP",
                            isError: true,
                          );
                          return;
                        }
                        context.read<AuthRemoteBloc>().add(
                          VerifyOtpEventRequested(
                            widget.email,
                            _otpKey.currentState?.getOtpValue() ?? '',
                          ),
                        );
                      },

                      width: 147,
                      color: AppColors.primaryContainerColor,
                      title: "Submit",
                      style: AppStyle.gemstoreSmallStyle,
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
