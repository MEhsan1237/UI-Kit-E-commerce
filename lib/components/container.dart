import 'package:flutter/material.dart';


class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF0D47A1),
        ),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("A Summer Surprise",style: TextStyle(color: Colors.white70,fontSize: 12,fontWeight: FontWeight.w300),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 4.0),
              child: Text("Cashback 20%",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w300),),
            ),

          ],
        ),
      ),
    );
  }
}
