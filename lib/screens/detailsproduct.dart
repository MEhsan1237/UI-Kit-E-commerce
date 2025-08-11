import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<String> images = [
    'assets/images/image_popular_product_1.png',
    'assets/images/image_popular_product_2.png',
    'assets/images/ps4_console_blue_1.png',
    'assets/images/ps4_console_white_1.png',
  ];

  int selectedIndex = 0;
  int selectedColorIndex = 0;
  bool isFavorite = false;
  bool isDescriptionExpanded = false;
  int quantity = 1;

  final List<Color> productColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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
          height: 180,
          child: Center(
            child: Image.asset(
              images[selectedIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Thumbnails Row
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
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
                      images[index],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Product Name + Favorite icon (separate lines)
        const Text(
          "Product Name",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
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

        // Short or Full Description
        Text(
          isDescriptionExpanded
              ? "This is the full description of the product. Here you can see all the details about the product, its features, material, size, and any other information you want to add."
              : "This is a short description of the product...",
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
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Product added to cart")),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.blue,
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
