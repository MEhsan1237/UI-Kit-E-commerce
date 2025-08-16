import 'package:e_ui_comm_kit/providers/tooglelike_class.dart';
import 'package:e_ui_comm_kit/providers/togglelike_provider.dart';
import 'package:e_ui_comm_kit/screens/allproductsscreen.dart';
import 'package:e_ui_comm_kit/screens/detailsproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likedProvider = Provider.of<ToggleLikedClass>(context);
    final allProducts = AllProductsScreen().productList;

    // filter only liked products
    final favProducts = allProducts
        .where((product) => likedProvider.isLiked(product["id"]!))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: favProducts.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 6 / 7,
        ),
        itemCount: favProducts.length,
        itemBuilder: (context, index) {
          final product = favProducts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                              image: product["image"]!,
                              label: product["label"]!,
                              price: product["price"]!,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        product["image"]!,
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      product["label"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product["price"]!,
                          style: const TextStyle(
                              color: Colors.deepOrangeAccent),
                        ),
                        ToggleLikeProvider(productId: product["id"]!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
