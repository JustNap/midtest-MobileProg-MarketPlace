import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_market_place/akun/login.dart';
import 'package:project_market_place/home/home.dart';
import './tema/theme.dart';
import 'bottom_nav.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Phone',
      theme: appTheme,
      home: LoginPage(),
      ),
    );
  }
}