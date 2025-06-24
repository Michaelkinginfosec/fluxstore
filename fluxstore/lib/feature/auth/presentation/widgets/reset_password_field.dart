import 'package:flutter/material.dart';

class ResetPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  const ResetPasswordField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 2, offset: Offset(2, 2), color: Colors.white),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "enter your email here",
          prefixIcon: Image.asset("assets/images/email.png"),
          enabled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
