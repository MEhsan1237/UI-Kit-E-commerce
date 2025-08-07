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
          Image(image: AssetImage("assets/images/Cart Icon.svg")),


          Image(image: AssetImage("assets/images/Cart Icon.svg")),


        ],
      ),
      body: Column(children: [SizedBox(height: 10), ContainerWidget(),
        SizedBox(height: 15,),
        IconRowWithLabels(icons: [
          Icons.home,
          Icons.light,
          Icons.flag,
          Icons.person,
          Icons.settings,

        ], labels: [
          "Home",
          "Likes",
          "Cart",
          "Profile",
          "Settings",

        ],),

      ]

      ),
    );
  }
}
