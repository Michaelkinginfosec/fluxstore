import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onTap;
  const HaveAccount({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
