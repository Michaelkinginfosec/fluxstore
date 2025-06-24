import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';

class MainPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  const MainPageAppbar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset("assets/images/menu.png", color: AppColors.black),
        ),
      ),
      title: Text("Gemstore", style: AppStyle.appBarTitleStyle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image.asset("assets/images/bell.png"),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
