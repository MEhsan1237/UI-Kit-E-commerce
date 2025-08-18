import 'package:flutter/material.dart';

class OverlapScreen extends StatelessWidget {
  const OverlapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300, // image ki height
              floating: false,
              pinned: false, // agar true karoge to image ka chhota part fixed rahega
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/image_banner_2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Positioned(top: 300,
          bottom: 300,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const Text(
                  "Screen Title",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  "Yahan apki information show hogi. "
                      "Neeche scroll karoge to image gaib ho jayegi, "
                      "upar scroll karoge to image wapas show ho jayegi.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                // Example content
                ...List.generate(
                  15,
                      (i) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Information Box ${i + 1}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
