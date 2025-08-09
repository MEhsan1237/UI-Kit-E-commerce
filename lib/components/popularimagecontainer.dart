import 'package:flutter/material.dart';

class PopularImageController extends StatefulWidget {
 final List <Map<String ,String>> imageItems= [
   {
     "images" : "assets/images/image_popular_product_1.png",

     "labels" : "Wireless Controller\nfor PS4"
   },
   {
     "images" : "assets/images/image_popular_product_2.png",
     "labels" : "Nike Sports White -\nMan Pant"
   },
   {
     "images" : "assets/images/glap.png",
     "labels" : "Gloves XC Omega -\nPolygon"
   },

 ];

    PopularImageController({
    super.key,

  });

  @override
  State<PopularImageController> createState() => _PopularImageControllerState();
}

class _PopularImageControllerState extends State<PopularImageController> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Product",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),

        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.imageItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 190,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            widget.imageItems[index]["images"]!), width: 70, // desired width
                        height: 70, // desired height
                        fit: BoxFit.contain,),
                      SizedBox(height: 10),
                      Text(widget.imageItems[index]["labels"]!,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
