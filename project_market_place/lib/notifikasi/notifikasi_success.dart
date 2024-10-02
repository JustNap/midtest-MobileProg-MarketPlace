import 'package:flutter/material.dart';

class NotifikasiSuccess extends StatelessWidget {
  final String pesanan;
  final VoidCallback onShowNotification; // Callback untuk menampilkan notifikasi

  NotifikasiSuccess({Key? key, required this.pesanan, required this.onShowNotification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Sukses!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Pembayaran Berhasil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pesanan Anda telah berhasil. Terima kasih!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Mengarahkan ke halaman notifikasi dengan data pesanan
                onShowNotification(); // Memanggil callback
              },
              child: Text('Tampilkan Rincian'),
            ),
          ],
        ),
      ),
    );
  }
}
