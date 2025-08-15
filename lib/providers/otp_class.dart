import 'dart:async';
import 'package:flutter/material.dart';

class OtpProvider with ChangeNotifier {
  int _secondsRemaining = 60;
  String _otpMessage = "";
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;
  String get otpMessage => _otpMessage;

  void startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        _secondsRemaining--;
        notifyListeners();
      }
    });
  }

  void resendOtp() {
    print("OTP Resent");
    _otpMessage = "OTP sent to +92*******123";
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () {
      _otpMessage = "";
      notifyListeners();
    });

    if (_secondsRemaining == 0) {
      startTimer();
    }
  }

  void disposeTimer() {
    _timer?.cancel();
  }
}
