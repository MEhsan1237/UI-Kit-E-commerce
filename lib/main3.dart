import 'package:e_ui_comm_kit/providers/tooglelike_class.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_ui_comm_kit/screens/detailsproduct.dart';
 void main()
 {

   runApp(ChangeNotifierProvider(create: (_)=> ToggleLikedClass(),
   child: MaterialApp(
       debugShowCheckedModeBanner: false,
     home: ProductDetailPage(),
   ),
   )
   );
 }
