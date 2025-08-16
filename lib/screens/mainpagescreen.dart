import 'package:e_ui_comm_kit/components/container.dart';
import 'package:e_ui_comm_kit/components/containericontext.dart';
import 'package:e_ui_comm_kit/components/imagecontainer.dart';
import 'package:e_ui_comm_kit/components/popularimagecontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreenFullWidgets extends StatelessWidget {
  const MainScreenFullWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search products",
              border: InputBorder.none,
              icon: SvgPicture.asset(
                "assets/icons/search_icon.svg",
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/cart_icon.svg", width: 20, height: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/bell.svg", width: 20, height: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ContainerWidget(),
            const SizedBox(height: 15),
            IconRowWithLabels(
              icons: [
                "assets/icons/flash_icon.svg",
                "assets/icons/bill_icon.svg",
                "assets/icons/game_icon.svg",
                "assets/icons/gift_icon.svg",
                "assets/icons/discover.svg",
              ],
              labels: ["Flash Deal", "Bill", "Game", "Daily Gift", "More"],
              iconSize: 24,
            ),
            ContainerImage(),
            const SizedBox(height: 10),
            PopularImageController(),
          ],
        ),
      ),
    );
  }
}