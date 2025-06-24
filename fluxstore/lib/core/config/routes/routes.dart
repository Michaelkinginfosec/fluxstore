import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/feature/auth/presentation/screens/create_password_screen.dart';
import 'package:fluxstore/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:fluxstore/feature/auth/presentation/screens/login_screen.dart';
import 'package:fluxstore/feature/auth/presentation/screens/verification_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/cart_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/home_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/main_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/onboarding_screen.dart';
import 'package:fluxstore/feature/auth/presentation/screens/signup_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/profile_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/search_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(
    path: '/',
    name: AppRoutes.welcome,
    builder: (context, state) => WelcomeScreen(),
  ),
  GoRoute(
    path: '/onboarding',
    name: AppRoutes.onboarding,
    builder: (context, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: '/login',
    name: AppRoutes.login,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/signup',
    name: AppRoutes.signup,
    builder: (context, state) => SignupScreen(),
  ),
  GoRoute(
    path: '/home',
    name: AppRoutes.home,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/main',
    name: AppRoutes.main,
    builder: (context, state) => MainScreen(),
  ),
  GoRoute(
    path: '/search',
    name: AppRoutes.search,
    builder: (context, state) => SearchScreen(),
  ),
  GoRoute(
    path: '/cart',
    name: AppRoutes.cart,
    builder: (context, state) => CartScreen(),
  ),
  GoRoute(
    path: '/profile',
    name: AppRoutes.profile,
    builder: (context, state) => ProfileScreen(),
  ),
  GoRoute(
    path: '/forgetpassword',
    name: AppRoutes.forgetpassword,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: '/createpassword',
    name: AppRoutes.createpassword,
    builder: (context, state) {
      final email = state.extra as String?;
      return CreatePasswordScreen(email: email);
    },
  ),
  GoRoute(
    path: '/verification',
    name: AppRoutes.verification,
    builder: (context, state) {
      final email = state.extra as String;
      return VerificationScreen(email: email);
    },
  ),
];
