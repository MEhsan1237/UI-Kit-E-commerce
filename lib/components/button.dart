import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonContinue({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 432,
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(
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
