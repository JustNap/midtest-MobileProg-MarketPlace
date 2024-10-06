import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_market_place/akun/login.dart';
import 'package:project_market_place/providers/cart_provider.dart';
import 'package:project_market_place/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import './tema/theme.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: InAppNotification(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce Phone',
            theme: appTheme,
            home: LoginPage(),
            routes: {
              '/cart': (context) => CartScreen(),
          }
        ),
      )
    );
  }
}
