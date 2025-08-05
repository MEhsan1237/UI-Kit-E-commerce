import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Please enter your email and we will send\nyou a link to return to your account",
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: emailController,
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
                borderSide: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          SizedBox(
            height: 40,
            width: 450,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ), // 👈 Change radius here
                ),

                backgroundColor: Colors.deepOrangeAccent,
              ),
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Don't have an account?"),
              SizedBox(width: 4),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sing Up",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
