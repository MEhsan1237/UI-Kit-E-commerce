import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_ui_comm_kit/onboarding/onboardingall_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset("assets/icons/gift_icon.svg",height: 90,width: 200,),
         animationDuration: Duration(seconds: 3),
        curve: Curves.bounceInOut,

        nextScreen: OnBoardingScreen(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        duration: 1000,
        backgroundColor: Colors.white70,
      ),

    );
  }
}
