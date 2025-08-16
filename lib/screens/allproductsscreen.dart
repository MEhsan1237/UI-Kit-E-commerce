import 'package:e_ui_comm_kit/providers/togglelike_provider.dart';
import 'package:e_ui_comm_kit/screens/detailsproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllProductsScreen extends StatefulWidget {
  final List<Map<String, String>> productList = [
    {
      "id": "1",
      "image": "assets/images/image_popular_product_1.png",
      "label": "Wireless Controller\nfor PS4™",
      "price": "\$64.99",
    },
    {
      "id": "2",
      "image": "assets/images/image_popular_product_2.png",
      "label": "Nike Sports White -\nMan Pant",
      "price": "\$50.5",
    },
    {
      "id": "3",
      "image": "assets/images/glap.png",
      "label": "Gloves XC Omega -\nPolygon",
      "price": "\$36.55",
    },
    {
      "id": "4",
      "image": "assets/images/wireless_headset.png",
      "label": "Logitech HyperTone\nHeadphones",
      "price": "\$20.2",
    },
    {
      "id": "5",
      "image": "assets/images/product_1_image.png",
      "label": "Yellow Thunder\nStreet Vibe",
      "price": "\$29.9",
    },
    {
      "id": "6",
      "image": "assets/images/product_2_image.png",
      "label": "Adidas Power\nRed Gear",
      "price": "\$32.5",
    },
    {
      "id": "7",
      "image": "assets/images/product_3_image.png",
      "label": "Leather Urban\nStyle",
      "price": "\$45.3",
    },
    {
      "id": "8",
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/back_icon.svg",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 6 / 7,
          ),
          itemCount: widget.productList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:  10.0,vertical: 10.0),
              child: Container(

                decoration: BoxDecoration(color: Colors.white),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Center(
                      child: InkWell( onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              image: widget.productList[index]["image"]!,
                              label: widget.productList[index]["label"]!,
                              price: widget.productList[index]["price"]!,
                            ),
                          ),
                        );
                      },
                        child: Image.asset(
                          widget.productList[index]["image"]!,
                          height: 100,
                          width: 150,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Row( crossAxisAlignment: CrossAxisAlignment.start,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                          child: Text(widget.productList[index]["price"]!,style: TextStyle(color: Colors.deepOrangeAccent),),
                        ),
                  ToggleLikeProvider(productId: widget.productList[index]["id"]!),


                      ]),
                    ),


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
