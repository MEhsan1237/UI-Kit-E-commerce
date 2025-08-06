import 'dart:async';
import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int _secondsRemaining = 60;
  Timer? _timer;
  String otpCode = "";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onOtpEntered(String code) {
    setState(() {
      otpCode = code;
    });
    print("Entered OTP: $code");
  }

  void resendOtp() {
    print("OTP Resent");
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("OTP Verification",style: TextStyle(fontSize: 15),),
        leading: IconButton(
          highlightColor: Colors.deepOrangeAccent,
          onPressed: () {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));

          }, icon: Icon(
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
            Text('OTP Verification', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(textAlign: TextAlign.center,'We have sent your code to +92*******123'),
            SizedBox(height: 10),
            Text(
              _secondsRemaining > 0
                  ? "Code will expire in 00:${_secondsRemaining.toString().padLeft(2, '0')}"
                  : "Code expired",
              style: TextStyle(color: Colors.red),
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
                  activeFillColor: Colors.black,
                  selectedColor: Colors.black54,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black54,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: false,
                onCompleted: (v) {
                  print("Completed: $v");
                },
                onChanged: (value) {},
              ),
            ),
              SizedBox(height: 100,),

              ButtonContinue(onPressed: (){
                 otpCode.length == 4 ? () {
                  print("Continue pressed with code: $otpCode");
                  // Navigate or verify manually
                } : null;

              },),

            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _secondsRemaining == 0 ? resendOtp : null,
                child: Text("Resend OTP Code",style: TextStyle(color: Colors.black,fontSize: 16
                ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
