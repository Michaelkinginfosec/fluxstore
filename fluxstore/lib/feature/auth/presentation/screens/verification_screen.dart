import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/otp_count_down_timer.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_app_bar.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/otp_input_field.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

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
                onCompleted: (otp) {
                  print("Entered OTP: $otp");
                },
              ),
              OtpCountdownTimer(
                onResend: () {
                  // ✅ Call your presenter / controller here
                  // e.g., context.read<YourCubit>().resendOtp(phone);
                  print('OTP resent to user');
                },
              ),
              AppSize.kHeight150,
              Align(
                alignment: Alignment.center,
                child: CustomContainer(
                  onTap: () => context.push(AppRoutes.createpassword),
                  // onTap: () {
                  //   final isComplete =
                  //       _otpKey.currentState?.isOtpComplete() ?? false;
                  //   final otp = _otpKey.currentState?.getOtpValue();

                  //   if (!isComplete) {
                  //     print('Please fill in all OTP fields.');
                  //   } else {
                  //     print('Submitting OTP: $otp');
                  //     // Perform your API request here.
                  //   }
                  // },
                  width: 147,
                  color: AppColors.primaryContainerColor,
                  title: "Submit",
                  style: AppStyle.gemstoreSmallStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
