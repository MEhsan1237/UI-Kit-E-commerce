import 'package:flutter/material.dart';

 class CheckboxProvider  extends ChangeNotifier{

   bool isChecked = false;

   void turnChecked ( bool val){
     isChecked = val;
     notifyListeners();
   }


 }