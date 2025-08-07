import 'dart:async';
import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:e_ui_comm_kit/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

// -------------------- OTP PROVIDER --------------------
class OtpProvider with ChangeNotifier {
  int _secondsRemaining = 60;
  String _otpMessage = "";
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;
  String get otpMessage => _otpMessage;

  void startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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

    Future.delayed(Duration(seconds: 3), () {
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

// -------------------- OTP SCREEN --------------------
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  String otpCode = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OtpProvider>(context, listen: false).startTimer();
    });
  }

  @override
  void dispose() {
    Provider.of<OtpProvider>(context, listen: false).disposeTimer();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print("rebuild widget");
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("OTP Verification", style: TextStyle(fontSize: 15)),
        leading: IconButton(
          highlightColor: Colors.deepOrangeAccent,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('OTP Verification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'We have sent your code to +92*******123',
            ),
            SizedBox(height: 10),

            // 🔁 Only this part rebuilds when timer updates
            Consumer<OtpProvider>(
              builder: (context, otpProvider, _) => Text(
                otpProvider.secondsRemaining > 0
                    ? "Code will expire in 00:${otpProvider.secondsRemaining.toString().padLeft(2, '0')}"
                    : "Code expired",
                style: TextStyle(color: Colors.red),
              ),
            ),

            SizedBox(height: 90),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: true,
                obscuringCharacter: '•',
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 55,
                  activeFillColor: Colors.deepOrangeAccent,
                  selectedColor: Colors.deepOrangeAccent,
                  activeColor: Colors.deepOrangeAccent,
                  inactiveColor: Colors.black54,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: false,
                onCompleted: (v) {
                  print("Completed: $v");
                  otpCode = v;
                },
                onChanged: (value) {},
              ),
            ),

            SizedBox(height: 100),

            ButtonContinue(
              onPressed: () {
                if (otpCode.length == 4) {
                  print("Continue pressed with code: $otpCode");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FullScreenImage()),
                  );
                }
              }, text: "Continue",
            ),

            SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () {
                  Provider.of<OtpProvider>(context, listen: false).resendOtp();
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),

            // 🔁 Only this part rebuilds when otpMessage updates
            Consumer<OtpProvider>(
              builder: (context, otpProvider, _) {

                if (otpProvider.otpMessage.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      otpProvider.otpMessage,
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 14,
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
