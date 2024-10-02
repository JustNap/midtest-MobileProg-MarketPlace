import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'jual/jual.dart'; // Import file jual.dart
=======
import 'package:project_market_place/home/home.dart';
import 'bottom_nav.dart';
>>>>>>> 40bc5fc9bd796423990238963845a85d856faf3c

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Produk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UploadProductScreen(),
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BotNavBar()
>>>>>>> 40bc5fc9bd796423990238963845a85d856faf3c
    );
  }
}
