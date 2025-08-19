import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:e_ui_comm_kit/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
   final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password", style: TextStyle(fontSize: 15)),
        leading: IconButton(

            onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  ModalRoute.withName('/SignUp'));
            }, icon: SvgPicture.asset("assets/icons/back_icon.svg")
      ),
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 0.1),
            Text(
              textAlign: TextAlign.center,
              "Please enter your email and we will send\nyou a link to return to your account",
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                controller: emailController,
                 validator: (value){
                  if(value==null|| value.isEmpty){
                    return "Enter Email";
                  }
                  return null;
                 },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
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
            SizedBox(height: 10,),
            ButtonContinue(onPressed: (){
              if(_formkey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),),);

              }
            }, text: "Continue",),


            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),

                TextButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

                  },
                  child: Text(
                    "Sing Up",
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
