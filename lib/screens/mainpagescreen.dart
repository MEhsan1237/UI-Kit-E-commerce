import 'package:e_ui_comm_kit/components/container.dart';
import 'package:e_ui_comm_kit/components/containericontext.dart';
import 'package:flutter/material.dart';

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
          decoration: BoxDecoration(

          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search products",
              border: InputBorder.none,


              icon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(onPressed: () {  },
            icon: Icon(Icons.shopping_cart_outlined,)),

          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(icon: Icon(Icons.notifications_none), onPressed: () {  },),
          ),



        ],
      ),
      body: Column(children: [SizedBox(height: 10), ContainerWidget(),
        SizedBox(height: 15,),
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
        )


      ]

      ),
    );
  }
}
