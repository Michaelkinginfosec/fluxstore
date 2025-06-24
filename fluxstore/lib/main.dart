import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/core/config/routes/route_config.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_bloc.dart';
import 'package:fluxstore/feature/common/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:fluxstore/injection/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize dependency injection
  await dependency();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthRemoteBloc>()),
        BlocProvider(create: (_) => NavigationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FluxStore',
      routerConfig: routerConfig,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
    );
  }
}
