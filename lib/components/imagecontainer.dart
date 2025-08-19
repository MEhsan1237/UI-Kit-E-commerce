import 'package:e_ui_comm_kit/screens/Chatscreen.dart';
import 'package:flutter/material.dart';

class ContainerImage extends StatefulWidget {
  final List<Map<String, String>> allItems = [
    {
      "image": "assets/images/image_banner_2.png",
      "title": "SmartPhone",
      "subtitle": "18 Brands",
    },
    {
      "image": "assets/images/image_banner_3.png",
      "title": "Fashions",
      "subtitle": "24 Brands",
    },
    {
      "image": "assets/images/image_banner_1.png",
      "title": "Laptops",
      "subtitle": "12 Brands",
    },
    {
      "image": "assets/images/image_banner_4.png",
      "title": "Makeup Products",
      "subtitle": "14 Brands",
    },
    {
      "image": "assets/images/image_banner_5.png",
      "title": "Perfumes",
      "subtitle": "22 Brands",
    },
  ];

  ContainerImage({super.key});



  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  "Special For you",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "See more",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: widget.allItems.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(14),

                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                            image: AssetImage(widget.allItems[index]["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),

                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),


                            ),


                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),widget.allItems[index]["title"]!),

                                Text(style: TextStyle(color: Colors.white70,fontSize: 12,fontWeight: FontWeight.w400),widget.allItems[index]["subtitle"]!),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                  ),
                    );

              },
            ),
          ),
        ],
      ),
    );
  }
}
