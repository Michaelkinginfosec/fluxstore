import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';

import 'package:fluxstore/core/constants/app_size.dart';
import 'package:go_router/go_router.dart';

class CreatePasswordCustomSnackbar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: 350,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSize.kHeight20,
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/Success.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppSize.kHeight20,
                Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSize.kHeight10,
                Text(
                  "Welcome back! Discover now!",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSize.kHeight10,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.go(AppRoutes.home);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "Browse home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
