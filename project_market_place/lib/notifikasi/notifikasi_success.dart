import 'package:flutter/material.dart';

class NotifikasiSuccess extends StatelessWidget {
  final String pesanan;
  final VoidCallback onShowNotification;

  NotifikasiSuccess({Key? key, required this.pesanan, required this.onShowNotification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Sukses!',
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
          fontFamily: 'poppins_bold',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.teal,
              size: 135,
            ),
            SizedBox(height: 30),
            Text(
              'Pembayaran Berhasil',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontFamily: 'poppins_italic',
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pesanan Anda telah berhasil. Terima kasih!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontFamily: 'poppins_regular',
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                onShowNotification();
              },
              child: Text('Tampilkan Rincian',
              style: TextStyle(
                fontFamily: 'poppins_regular',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
