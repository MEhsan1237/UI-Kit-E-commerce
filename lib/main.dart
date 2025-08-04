import 'package:e_ui_comm_kit/onboarding/onboardingall_scree.dart';
import 'package:flutter/material.dart';

import 'onboarding/copy.dart';
import 'onboarding/onboard_screen.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    ),
    debugShowCheckedModeBanner: false,
    home:
    MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MySplashApp(),
    );
  }
}
