import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_splash1.dart';
import 'onboarding_splash2.dart';
import 'onboarding_splash3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:  Stack(
     children: [
       PageView(
         controller: _controller,
         onPageChanged: (index){
           setState(() {
             isLastPage = (index == 2);
           }
           );
         },
         children: const [
           OnboardingPage1(),
           OnboardingPage2(),
           OnboardingPage3(),
         ],
       ),

       Positioned(
           bottom: 100,
           left: 20,
           right: 20,


           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               SmoothPageIndicator(
                 controller: _controller,
                 count: 3,
                 effect: const WormEffect(dotHeight: 10, dotWidth: 10,activeDotColor: Colors.red),
               ),
               const SizedBox(height: 16),

             ],
           ),
       ),
     ],
   ),
    );
  }
}

