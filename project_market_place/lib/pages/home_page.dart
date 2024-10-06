import 'package:flutter/material.dart';
import '../widgets/cart_icon.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        actions: [
          CartIcon(),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Marketplace!'),
      ),
    );
  }
}
