import 'package:flutter/material.dart';

import 'notifikasi/notifikasi_success.dart'; // Import halaman notifikasi oke
import 'notifikasi/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> notifications = [];
  int orderCount = 0; // Untuk menghitung jumlah pesanan

  void _addNotification() {
    setState(() {
      orderCount++;
      notifications.add({
        'title': 'Pesanan Tiba',
        'description': 'Pesanan $orderCount',
        'date': DateTime.now().toString(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Simulasi pembayaran berhasil dan pindah ke halaman notifikasi oke
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotifikasiSuccess()), // Halaman setelah pembayaran berhasil
                ).then((_) {
                  _addNotification(); // Tambah notifikasi setelah kembali
                });
              },
              child: Text('Bayar Sekarang'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman notifikasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NotifikasiPage(notifications: notifications)),
                );
              },
              child: Text('Lihat Notifikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
