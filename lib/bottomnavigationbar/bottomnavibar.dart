import 'package:e_ui_comm_kit/screens/detailscreen.dart';
import 'package:e_ui_comm_kit/screens/favouritescreen.dart';
import 'package:e_ui_comm_kit/screens/mainpagescreen.dart';
import 'package:e_ui_comm_kit/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  // screens
  final List<Widget> _screens = [

    MainScreenFullWidgets(),
    FavoritesScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,




        onTap: (int index) {
          setState(() {
            _selectedIndex = index;

          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/shop_icon.svg", width: 20, height: 20, color: _selectedIndex == 0 ? Color(0xFFFF7643) : Color(0xFF757575),),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/heart_icon.svg", width: 20, height: 20,color: _selectedIndex == 1 ? Color(0xFFFF7643) : Color(0xFF757575),),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/chat_bubble_Icon.svg", width: 20, height: 20, color: _selectedIndex == 2 ? Color(0xFFFF7643) : Color(0xFF757575),),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/user_icon.svg", width: 20, height: 20, color: _selectedIndex == 3 ? Color(0xFFFF7643) : Color(0xFF757575),),
          ),
        ],
      ),
    );
  }
}