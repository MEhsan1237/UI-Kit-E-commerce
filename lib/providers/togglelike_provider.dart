import 'package:e_ui_comm_kit/providers/tooglelike_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleLikeProvider extends StatelessWidget {
  final String productId;
  const ToggleLikeProvider({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToggleLikedClass>(
      builder: (context, value, child) {

        final liked = value.isLiked(productId);
        return IconButton(
          onPressed: () {
            value.toggleLiked(productId);
          },
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
