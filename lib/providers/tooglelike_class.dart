import 'package:flutter/material.dart';

class ToggleLikedClass  extends ChangeNotifier{

  bool _isLiked = false;
  bool get  isLiked => _isLiked;

  void toggleLiked ( bool val){
    _isLiked  = val;
    notifyListeners();
  }


}