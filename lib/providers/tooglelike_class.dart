import 'package:flutter/foundation.dart';

class ToggleLikedClass extends ChangeNotifier {
  final Map<String, bool> _likedStatus = {}; // product id ke liye liked status

  bool isLiked(String productId) => _likedStatus[productId] ?? false;

  void toggleLiked(String productId) {
    _likedStatus[productId] = !(_likedStatus[productId] ?? false);
    notifyListeners();
  }
}
