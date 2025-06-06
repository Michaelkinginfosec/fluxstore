import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_config.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: routerConfig,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
      ),
    );
  }
}
