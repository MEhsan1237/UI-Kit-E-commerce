import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/components/mainweb_page.dart';
import 'package:e_ui_comm_kit/providers/checkbox_provider.dart';
import 'package:e_ui_comm_kit/screens/otpverificationscreen.dart';
import 'package:e_ui_comm_kit/screens/signup.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Sign In", style: TextStyle(fontSize: 15)),

        ),

        body:  Form(
          key:  _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              textAlign: TextAlign.center,
              "Sign in with your email and password\nor continue with social media",
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                 validator:  (value){
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                     return null;
                 },
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.email, size: 20, color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                validator: (value){

                  if(value!.isEmpty){
                     return "Enter password";

                  }
                   return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.lock, size: 20, color: Colors.black),

                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CheckBoxProviderScreen(),
            ),
            SizedBox(height: 10),
            ButtonContinue(
              onPressed: () {
                if(_formKey.currentState!.validate()){

                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpVerificationScreen(),
                  ),
                );
              },
              text: "Continue",
            ),
            SizedBox(height: 15),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MainWebPage(),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("   Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 75),
          ],
        ),)
      ),
    );
  }
}
