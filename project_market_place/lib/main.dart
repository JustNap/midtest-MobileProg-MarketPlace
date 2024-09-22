import 'package:flutter/material.dart';
import 'package:project_market_place/home/home.dart';
import 'bottom_nav.dart';

import 'notifikasi/notifikasi_success.dart';
import 'notifikasi/page.dart';

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
