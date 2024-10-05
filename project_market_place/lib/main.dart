import 'package:flutter/material.dart';
import 'bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Produk',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BotNavBar()
     );
  }
}
