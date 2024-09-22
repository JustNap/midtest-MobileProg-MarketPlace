import 'package:flutter/material.dart';
import 'package:project_market_place/home/home.dart';
import 'bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BotNavBar()
    );
  }
}
