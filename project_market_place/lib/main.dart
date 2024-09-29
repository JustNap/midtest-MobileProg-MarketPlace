import 'package:flutter/material.dart';
import 'package:project_market_place/home/home.dart';
import './tema/theme.dart';
import 'bottom_nav.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: appTheme,
      home: BotNavBar(),
    );
  }
}
