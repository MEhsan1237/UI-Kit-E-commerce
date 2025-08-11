import 'package:e_ui_comm_kit/providers/togglelike_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllProductsScreen extends StatefulWidget {
  final List<Map<String, String>> productList = [
    {
      "image": "assets/images/image_popular_product_1.png",
      "label": "Wireless Controller\nfor PS4™",
      "price": "\$64.99",
    },
    {
      "image": "assets/images/image_popular_product_2.png",
      "label": "Nike Sports White -\nMan Pant",
      "price": "\$50.5",
    },
    {
      "image": "assets/images/glap.png",
      "label": "Gloves XC Omega -\nPolygon",
      "price": "\$36.55",
    },
    {
      "image": "assets/images/wireless_headset.png",
      "label": "Logitech HyperTone\nHeadphones",
      "price": "\$20.2",
    },
    {
      "image": "assets/images/product_1_image.png",
      "label": "Yellow Thunder\nStreet Vibe",
      "price": "\$29.9",
    },
    {
      "image": "assets/images/product_2_image.png",
      "label": "Adidas Power\nRed Gear",
      "price": "\$32.5",
    },
    {
      "image": "assets/images/product_3_image.png",
      "label": "Leather Urban\nStyle",
      "price": "\$45.3",
    },
    {
      "image": "assets/images/product_4_image.png",
      "label": "Retro Classic\nRiding",
      "price": "\$19.4",
    },
  ];

  AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Products"),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/icons/back_icon.svg",
            width: 20,
            height: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 6 / 7,
          ),
          itemCount: widget.productList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.white),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: InkWell( onTap: (){},
                        child: Image.asset(
                          widget.productList[index]["image"]!,
                          height: 110,
                          width: 210,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      widget.productList[index]["label"]!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),

                  Row( crossAxisAlignment: CrossAxisAlignment.start,

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 21,top: 10),
                      child: Text(widget.productList[index]["price"]!,style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),
                        ToggleLikeProvider(productId: index.toString()),


                  ]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
