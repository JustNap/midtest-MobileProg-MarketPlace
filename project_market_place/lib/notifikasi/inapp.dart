import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:project_market_place/bottom_nav.dart';

import '../chat.dart';
import 'notifikasi_success.dart';
import 'page.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BotNavBar()),
            );
          },
        ),
        title: Text('Notifikasi Lokal',
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
          fontFamily: 'poppins_bold',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            },
          )
        ],
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pesanan dipesan: $_count',
            style: TextStyle(
              fontFamily: 'poppins_regular',
              fontSize: 20,
              fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                )
              ),
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
                          pesanan: 'Klik disini',
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
              child: Text('Lihatkan Notifikasi',
              style: TextStyle(
                fontFamily: 'poppins_mediumi',
                fontSize: 16,
                fontWeight: FontWeight.bold
                ),
              ),
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
                    'Pesanan: $count Berhasil! \n' 'Klik Disini',
                    style: TextStyle(
                      fontFamily: 'poppins_extrabi',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
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
