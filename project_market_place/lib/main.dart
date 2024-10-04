import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'bottom_nav.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(

      title: 'Marketplace Phone',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BotNavBar()
      ),
    );
  }
}
