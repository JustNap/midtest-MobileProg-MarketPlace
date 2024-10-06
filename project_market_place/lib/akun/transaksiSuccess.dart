import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_market_place/bottom_nav.dart';
import 'package:project_market_place/models/product.dart';
import 'package:project_market_place/notifikasi/page.dart';
import '../notifikasi/page.dart';

class TransactionSuccessPage extends StatelessWidget {
  final double totalAmount;
  final List<Product> cartItems;

  TransactionSuccessPage({required this.totalAmount, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Icon(
                      Icons.check_circle,
                      color: Colors.teal,
                      size: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Pesanan Berhasil dipesan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(totalAmount)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotifikasiPage(notifications: [],
                            ),
                          )
                        );
                      },
                      child: Text(
                        'Lihat Detail',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Selesai',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BotNavBar()),
                          MaterialPageRoute(
                              builder: (context) => NotifikasiPage(notifications: [],)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
