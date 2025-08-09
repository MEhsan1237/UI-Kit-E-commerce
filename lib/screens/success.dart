import 'package:e_ui_comm_kit/components/button.dart';
import 'package:e_ui_comm_kit/screens/mainpagescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            highlightColor: Colors.deepOrangeAccent,
            onPressed: (){
              Navigator.pop(context);
            }, icon: SvgPicture.asset("assets/icons/back_icon.svg")
        ),
        centerTitle: true,
        title: Text("Login Success", style: TextStyle(fontSize: 15)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Image.asset("assets/images/success.png",fit: BoxFit.cover,),

            ),
          ),
           Expanded(
             flex: 1,
             child:  Center(
               child: Column( mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 10,),

                   Text(
                     "Login Success",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 28,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   SizedBox(height: 70,),
                   ButtonContinue(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageScreen(),));

                   }, text: "Back to home",),
                 ],
               ),
             ))

        ],
      ),
    );
  }
}
