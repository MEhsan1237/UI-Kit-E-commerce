import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<String> images = [
    'assets/images/ps4_console_white_1.png',
    'assets/images/ps4_console_white_2.png',
    'assets/images/ps4_console_white_3.png',
    'assets/images/ps4_console_blue_1.png',
  ];

  int selectedIndex = 0;
  int selectedColorIndex = 0;
  bool isFavorite = false;
  bool isDescriptionExpanded = false;
  int quantity = 1;

  final List<Color> productColors = [
    Colors.red,
    Colors.purple,
    Colors.grey,
    Colors.lightGreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/icons/back_icon.svg",
            width: 20,
            height: 20,
          ),
        ),

        actions: [
         Text("4.7"),

          Padding(
            padding: const EdgeInsets.only(right: 14.0,left: 3),
            child: SvgPicture.asset("assets/icons/star_icon.svg"),
          ),

        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildMainContent(),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Smaller main image
        SizedBox(
          height: 170,
          child: Center(
            child: Image.asset(
              images[selectedIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Thumbnails Row
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 30),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,


                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        images[index],
                        width: 40,
                        height: 1,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 36),

        // Product Name + Favorite icon (separate lines)
        const Text(
         "Wireless Controller for PS4™",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Align( alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ),

        // Short or Full Description
        Text(
          isDescriptionExpanded
              ? "with other through the laptops and the mobile phones."
              : "Wireless Controller for PS4™ gives you what you want in your gaming from over precision your games to sharing...",
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),

        // See more details button
        TextButton(
          onPressed: () {
            setState(() {
              isDescriptionExpanded = !isDescriptionExpanded;
            });
          },
          child: Text(
            isDescriptionExpanded
                ? "See less details >"
                : "See more details >",
            style: const TextStyle(color: Colors.blue),
          ),
        ),

        const SizedBox(height: 10),

        // Colors + Quantity
        Row(
          children: [
            for (int i = 0; i < productColors.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = i;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedColorIndex == i
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: productColors[i],
                    radius: 14,
                  ),
                ),
              ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              "$quantity",
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Add to Cart Button
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(

            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Product added to cart")),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            child: const Text(
              "Add to Cart",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
