import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/providers/checkbox_provider.dart';
import 'package:e_ui_comm_kit/providers/checkbox_provider_class.dart';
import 'package:e_ui_comm_kit/screens/forgotpassword.dart';


import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text("Sign In",style: TextStyle(fontSize: 15),),
          leading: IconButton(
              highlightColor: Colors.deepOrangeAccent,
              onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 20, color: Colors.black,)),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),

           Text("Welcome Back",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900),),
            SizedBox(height: 5.0,),
            Text(textAlign: TextAlign.center,
                "Sign in with your email and password\nor continue with social media"),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: TextFormField(

                controller: emailController,
                decoration: InputDecoration(
                    contentPadding:  EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                    suffixIcon: Icon(Icons.email,size: 20, color: Colors.black,),
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,

                    ),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    )
                  )
                ),

              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: TextFormField(

                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding:  EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                  suffixIcon: Icon(Icons.lock,size: 20, color: Colors.black,),

                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter your password",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,

                      ),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blue,
                        )
                    )
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(8.0),
            child:  CheckBoxProviderScreen(),
            ),
            SizedBox(height: 15,),
            ButtonContinue(),
            SizedBox(height: 5,),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),


          ],
        ),
      ),
    );
  }
}
