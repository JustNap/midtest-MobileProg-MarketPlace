import 'package:flutter/material.dart';
import 'package:project_market_place/screens/cart_screen.dart';
import 'package:project_market_place/screens/product_list_screen.dart';

import 'akun/akun.dart';
import 'home/home.dart';
import 'jual/jual.dart';
import 'notifikasi/inapp.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProductListScreen(),
    UploadProductScreen(),
    Notifikasi(),
    AkunPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'keranjang',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Jual',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun Saya',
          ),
        ],
        selectedItemColor: Colors.teal,
      ),
    );
  }
}
