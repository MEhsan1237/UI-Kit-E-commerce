import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/components/mainweb_page.dart';
import 'package:e_ui_comm_kit/screens/otpverificationscreen.dart';
import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }



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
            icon:SvgPicture.asset("assets/icons/back_icon.svg")
          ),
        ),
        body:  Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              "Register Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              textAlign: TextAlign.center,
              "Complete your details or continue\nwith social media",
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                validator: (value){
                  if(  value == null ||value.isEmpty) {
                    return "enter email";
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
                  if( value==null||value.isEmpty){
                    return "Enter Password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;

                },
                obscureText: true,
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
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(

                validator: (value){

                  if( value == null||value.isEmpty){
                    return "Enter Confirm Password";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 35,
                  ),
                  suffixIcon: Icon(Icons.lock, size: 20, color: Colors.black),

                  labelText: " Confirm Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Re-enter your password",
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
            SizedBox(height: 10,),
            ButtonContinue(

              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(),));
                }


            }, text: "Continue",),
            SizedBox(height:10,),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MainWebPage(),
              ),
            ),

            Text( textAlign: TextAlign.center,
                "By continuing confirm that you agree\nwith our Term and Condition"),
            SizedBox(height: 10,),

          ],
        ),)
      ),
    );
  }
}
