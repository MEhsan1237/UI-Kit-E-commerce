import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/providers/otp_class.dart';

import 'package:e_ui_comm_kit/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formkey = GlobalKey<FormState>();
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
        title: const Text("OTP Verification", style: TextStyle(fontSize: 15)),
        leading: IconButton(
          
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),
      ),
      body:   Form(
        key:  _formkey,
        child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              'We have sent your code to +92*******123',
            ),
            const SizedBox(height: 10),

            // Timer text
            Consumer<OtpProvider>(

              builder: (context, otpProvider, _) => Text(
                otpProvider.secondsRemaining > 0
                    ? "Code will expire in 00:${otpProvider.secondsRemaining.toString().padLeft(2, '0')}"
                    : "Code expired",
                style: const TextStyle(color: Colors.red),
              ),
            ),

            const SizedBox(height: 90),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: PinCodeTextField(
                keyboardType:  TextInputType.number,

                appContext: context,
                length: 4,

                obscuringCharacter: '•',
                animationType: AnimationType.fade,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Enter Otp";
                  }

                  return null;
                },
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
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                onChanged: (value) {
                  otpCode = value;
                },
                onCompleted: (v) {
                  print("Completed: $v");
                  otpCode = v;
                },

              ),
            ),

            const SizedBox(height: 100),

            ButtonContinue(
              onPressed: () {

                  if(_formkey.currentState!.validate()){

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FullScreenImage()),
                    );

                  }


              },
              text: "Continue",
            ),

            const SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () {
                  Provider.of<OtpProvider>(context, listen: false).resendOtp();
                },
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),

            Consumer<OtpProvider>(
              builder: (context, otpProvider, _) {
                if (otpProvider.otpMessage.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      otpProvider.otpMessage,
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 14,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),)
    );
  }
}
