import 'package:e_ui_comm_kit/bottomnavigationbar/bottomnavibar.dart';
import 'package:e_ui_comm_kit/onboarding/copy.dart';
import 'package:e_ui_comm_kit/onboarding/onboardingall_scree.dart';
import 'package:e_ui_comm_kit/providers/checkbox_provider_class.dart';
import 'package:e_ui_comm_kit/providers/otp_class.dart';
import 'package:e_ui_comm_kit/providers/tooglelike_class.dart';
import 'package:e_ui_comm_kit/screens/Chatscreen.dart';
import 'package:e_ui_comm_kit/screens/allproductsscreen.dart';
import 'package:e_ui_comm_kit/screens/mainpagescreen.dart';
import 'package:e_ui_comm_kit/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_) => CheckboxProvider()),
      ChangeNotifierProvider(create: (_)=> OtpProvider()),
      ChangeNotifierProvider(create: (_)=> ToggleLikedClass()),

    ],
    child: MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home:
      MyApp(),
    ),
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
      body:  MySplashApp()
    );
  }
}
