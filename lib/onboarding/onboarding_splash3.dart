import 'package:flutter/material.dart';

import '../components/colors.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        Text(
          "TOKOTO",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        SizedBox(height: 10.0),
        Text("We show the easy way to shop.\nJust stay at home with us",textAlign: TextAlign.center,),
        Container( width: 300,
          height: 250,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/splash_3.png"),
            ),
          ),
        ),
        SizedBox(height: 150,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
          child: Container(
            width: double.infinity,
            height: 35,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                onPressed: (){}, child: Text("Continue", style: TextStyle(
              color: AppColors.onSecondary,
              fontSize: 16,
            ),)),
          ),
        ),
      ],
    );
  }
}
