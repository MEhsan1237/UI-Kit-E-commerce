import 'package:e_ui_comm_kit/components/container.dart';
import 'package:e_ui_comm_kit/components/containericontext.dart';
import 'package:e_ui_comm_kit/components/imagecontainer.dart';
import 'package:e_ui_comm_kit/components/popularimagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search products",
              border: InputBorder.none,
    
              icon: SvgPicture.asset("assets/icons/search_icon.svg",width: 20,height: 20,),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/cart_icon.svg",width: 20,height: 20,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/bell.svg",width: 20,height: 20,),
              onPressed: () {},
            ),
          ),
        ],


      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0, // space around notch
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(

                onPressed: (){}, icon: SvgPicture.asset("assets/icons/Shop_Icon.svg",width: 20,
                  height: 20,   )
                  ,
      ),
              IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/heart_icon.svg",width: 20,
                height: 20,)
              ),
              IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/chat_bubble_Icon.svg",width: 20,
                height: 20,)
              ),
              IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/user.svg",width: 20,
                height: 20,)
              ),
      ]
    ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ContainerWidget(),
            SizedBox(height: 15),
            IconRowWithLabels(
            
              icons: [
                "assets/icons/flash_icon.svg",
                "assets/icons/bill_icon.svg",
                "assets/icons/game_icon.svg",
                "assets/icons/gift_icon.svg",
                "assets/icons/discover.svg",
              ],
              labels: ["Flash Deal", "Bill", "Game", "Daily Gift", "More"],
            
              iconSize: 24, // only icon changes size, container stays 50x50
            ),
            ContainerImage(),
            SizedBox(height: 10,),
            PopularImageController(),
            
            
            
            
            
            
            
            
            
          ],
        ),
      ),

    );
  }
}
