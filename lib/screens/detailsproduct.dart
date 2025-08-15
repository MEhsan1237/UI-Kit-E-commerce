import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String label;
  final String price;

  const ProductDetailPage({
    super.key,
    required this.image,
    required this.label,
    required this.price,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<String> productImages; // All images for the product
  int selectedIndex = 0; // For big image change
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

  final String fullDescription =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision your games to sharing with other through the laptops and the mobile phones.";

  @override
  void initState() {
    super.initState();

    // You can customize these images per product
    productImages = [
      widget.image, // First image is the clicked one
      'assets/images/ps4_console_white_2.png',
      'assets/images/ps4_console_white_3.png',
      'assets/images/ps4_console_white_4.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),
        actions: [
          const Text("4.7"),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 3),
            child: SvgPicture.asset("assets/icons/star_icon.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big main image
            SizedBox(
              height: 170,
              child: Center(
                child: Image.asset(
                  productImages[selectedIndex],
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Thumbnails row
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productImages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
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
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          productImages[index],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Product name
            Text(
              widget.label,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.centerRight,
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

            // Description
            Text(
              isDescriptionExpanded
                  ? fullDescription
                  : "${fullDescription.substring(0, 80)}...",
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isDescriptionExpanded = !isDescriptionExpanded;
                });
              },
              child: Text(
                isDescriptionExpanded
                    ? "Less details"
                    : "More details",
                style: const TextStyle(color: Colors.blue),
              ),
            ),

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

            // Add to cart
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${widget.label} added to cart for ${widget.price}"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
