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
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Sign In",style: TextStyle(fontSize: 15),),
        leading: IconButton(
            highlightColor: Colors.deepOrangeAccent,
            onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 20, color: Colors.black,)),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
         
         Text("Welcome Back",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),
          SizedBox(height: 5.0,),
          Text(textAlign: TextAlign.center,
              "Sign in with your email and password\nor continue with social media"),
          SizedBox(height: 5.0,),
          TextFormField(

            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(Icons.email,size: 10, color: Colors.black,),
              
              labelText: "Email",
              hintText: "Enter your email",
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black,

                ),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blue,
                )
              )
            ),

          ),
          SizedBox(height: 5.0,),
          TextFormField(
            

            controller: passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.lock,size: 10, color: Colors.black,),

                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.black,

                  ),

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                )
            ),

          )

        ],
      ),
    );
  }
}
