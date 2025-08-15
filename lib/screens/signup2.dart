import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign Up", style: TextStyle(fontSize: 15)),
          leading: IconButton(
            highlightColor: Colors.deepOrangeAccent,
            onPressed: () {

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));

            },
            icon: SvgPicture.asset("assets/icons/back_icon.svg")
          ),
          ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            Text(
              "Complete Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              textAlign: TextAlign.center,
              "Complete your details or continue\nwith social media",
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.person, size: 20, color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  labelText: "First Name",
                  hintText: "Enter your first name",
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
                controller: lastNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.person, size: 20, color: Colors.black),

                  labelText: "Last name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your last name",
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
                controller: phoneNumberController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.phone_android, size: 20, color: Colors.black),

                  labelText: "phone number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "enter your phone number",
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
            SizedBox(height: 15.0,),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.location_on_outlined, size: 20, color: Colors.black),

                  labelText: "Address",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your address",
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
            SizedBox(height: 20,),
            ButtonContinue(onPressed: () {  }, text: "Continue",),
            Text( textAlign: TextAlign.center,
                "By continuing confirm that you agree\nwith our Term and Condition"),
            SizedBox(height: 60,),

          ],
        ),
      ),
    );
  }
}
