import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_dot.dart';
import 'package:fluxstore/feature/common/presentation/widgets/onboard_container.dart';
import 'package:fluxstore/feature/common/presentation/widgets/onboard_screen.dart';
import 'package:fluxstore/feature/common/presentation/widgets/onboarding_background.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onNextPressed() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardingBackground(),
          OnboardScreen(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),

          CustomDot(currentPage: _currentPage),
          OnboardContainer(
            onTap: () {
              if (_currentPage == 2) {
                context.go(AppRoutes.signup);
              } else {
                _onNextPressed();
              }
            },
            title: _currentPage == 2 ? "Shop now" : "Next",
          ),
        ],
      ),
    );
  }
}
