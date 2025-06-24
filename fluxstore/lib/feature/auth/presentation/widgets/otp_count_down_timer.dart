import 'dart:async';

import 'package:flutter/material.dart';

class OtpCountdownTimer extends StatefulWidget {
  final VoidCallback onResend;

  const OtpCountdownTimer({super.key, required this.onResend});

  @override
  State<OtpCountdownTimer> createState() => _OtpCountdownTimerState();
}

class _OtpCountdownTimerState extends State<OtpCountdownTimer> {
  static const int _initialTime = 60;
  late int _secondsRemaining;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsRemaining = _initialTime;
    _canResend = false;
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  void _handleResend() {
    if (_canResend) {
      widget.onResend();
      _startCountdown();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _canResend
              ? 'Didn\'t receive the code?'
              : 'Resend in $_secondsRemaining seconds',
          style: TextStyle(fontSize: 14),
        ),
        TextButton(
          onPressed: _canResend ? _handleResend : null,
          child: Text(
            'Resend OTP',
            style: TextStyle(color: _canResend ? Colors.blue : Colors.grey),
          ),
        ),
      ],
    );
  }
}
