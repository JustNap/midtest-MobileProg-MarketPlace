import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

import 'bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(

      title: 'Flutter Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BotNavBar()
      ),
    );
  }
}
