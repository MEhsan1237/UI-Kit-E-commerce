import 'package:e_ui_comm_kit/bottomnavigationbar/bottomnavibar.dart';
import 'package:e_ui_comm_kit/providers/tooglelike_class.dart';
import 'package:e_ui_comm_kit/providers/togglelike_provider.dart';
import 'package:e_ui_comm_kit/screens/allproductsscreen.dart';
import 'package:e_ui_comm_kit/screens/detailsproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        leading: IconButton(

          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageScreen(),));
          },
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
        ),
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: favProducts.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 7 / 9,
        ),
        itemCount: favProducts.length,
        itemBuilder: (context, index) {
          final product = favProducts[index];
          return Container(
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
                      height: 80,
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    product["label"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      color:  Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        product["price"]!,
                        style: const TextStyle(
                            color: Colors.deepOrangeAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:6.0),
                      child: ToggleLikeProvider(productId: product["id"]!),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
