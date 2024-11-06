import 'package:flutter/material.dart';

import '../screens/cart/shoppingcartpage.dart';
import '../screens/home/homepage.dart';
import '../screens/orderPage/myorder.dart';
import '../screens/profile/profile_screen.dart';

class Maincontainer extends StatefulWidget {
  @override
  _MaincontainerState createState() => _MaincontainerState();
}

class _MaincontainerState extends State<Maincontainer> {
  int _currentIndex = 0;

  // Screens for each tab
  final List<Widget> _screens = [
    Homepage(),
    ShoppingCartPage(),
    Orederpage(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected tab's content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Handle tab selection
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/images/order.png',
              ),
              size: 20, // Set size for the icon
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFF027335),
        unselectedItemColor: Color(0xFF888888),
      ),
    );
  }
}
