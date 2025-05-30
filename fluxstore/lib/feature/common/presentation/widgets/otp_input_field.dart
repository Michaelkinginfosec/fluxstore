import 'package:flutter/material.dart';

class OtpInputField extends StatefulWidget {
  final int length;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final void Function(String)? onCompleted;

  const OtpInputField({
    super.key,
    this.length = 6,
    this.width = 50,
    this.height = 60,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.onCompleted,
  });

  @override
  State<OtpInputField> createState() => OtpInputFieldState();
}

class OtpInputFieldState extends State<OtpInputField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    String currentOtp = _controllers.map((c) => c.text).join();
    if (currentOtp.length == widget.length && !currentOtp.contains('')) {
      widget.onCompleted?.call(currentOtp);
    }
  }

  String getOtpValue() {
    return _controllers.map((c) => c.text).join();
  }

  bool isOtpComplete() {
    return _controllers.every((c) => c.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: BorderSide(width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: BorderSide(width: 1),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
