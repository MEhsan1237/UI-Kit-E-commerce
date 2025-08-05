import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 450,
      child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // 👈 Change radius here
          ),

          backgroundColor: Colors.deepOrangeAccent,
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
