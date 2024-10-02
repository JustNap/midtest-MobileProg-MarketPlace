import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

import 'notifikasi_success.dart';
import 'page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
        title: 'In-App Notification Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Notifikasi(),
      ),
    );
  }
}

class Notifikasi extends StatefulWidget {
  @override
  NotifikasiState createState() => NotifikasiState();
}

class NotifikasiState extends State<Notifikasi> {
  int _count = 0;
  int _duration = 3000;
  List<String> _notifications = [];

  void _incrementCount() => setState(() {
        _count++;
        _notifications.add('Pesanan $_count Berhasil');
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi Lokal'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current count: $_count'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _incrementCount();
                InAppNotification.show(
                  child: NotificationBody(
                    count: _count,
                  ),
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotifikasiSuccess(
                          pesanan: 'Pesanan $_count Berhasil',
                          onShowNotification: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotifikasiPage(notifications: _notifications),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  duration: Duration(milliseconds: _duration),
                );
              },
              child: Text('Lihatkan Notifikasi'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class NotificationBody extends StatelessWidget {
  final int count;

  NotificationBody({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 12,
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightGreen.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  width: 1.4,
                  color: Colors.lightGreen.withOpacity(0.2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Pesanan: $count Berhasil',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
