import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/feature/common/presentation/widgets/background_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_container.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundContainer(),
        //dark background overlay
        Container(color: Color.fromRGBO(0, 0, 0, 0.5)),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome to GemStore!",
                  style: AppStyle.gemstoreBigStyle,
                ),
              ),
              AppSize.kHeight10,
              Text(
                "The Home for a fashionista",
                style: AppStyle.gemstoreSmallStyle,
              ),
              AppSize.kHeight40,
              CustomContainer(
                width: 193,
                color: AppColors.whiteWith25Opacity,
                onTap: () => context.push(AppRoutes.onboarding),
                title: "Get Started",
                style: AppStyle.primaryContainerStyle,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
