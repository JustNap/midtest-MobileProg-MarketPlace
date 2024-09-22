import 'package:flutter/material.dart';
import 'home/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MarketplaceHomePage(),
    );
  }
}
