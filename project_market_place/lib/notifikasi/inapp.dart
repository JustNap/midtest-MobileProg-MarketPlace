import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

class Notifikasi extends StatefulWidget {
  @override
  NotifikasiState createState() => NotifikasiState();
}

class NotifikasiState extends State<Notifikasi> {
  int _count = 0;
  int _duration = 3000; // Durasi default tetap ada

  void _incrementCount() => setState(() => _count++);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pesanan yang ke $_count'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _incrementCount();
                InAppNotification.show(
                  child: NotificationBody(
                    count: _count,
                  ),
                  context: context,
                  onTap: () => print('Notification tapped!'),
                  duration: Duration(milliseconds: _duration),
                );
              },
              child: Text('Lihatkan Notifikasi'),
            ),
            const SizedBox(height: 32),
            // Menghapus tombol Dismiss Notification
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
