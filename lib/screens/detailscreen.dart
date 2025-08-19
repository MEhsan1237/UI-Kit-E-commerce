import 'package:e_ui_comm_kit/bottomnavigationbar/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(

          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageScreen(),));
          },
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),
        title: const Text("Simple Container Screen"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              "Hello Container",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
