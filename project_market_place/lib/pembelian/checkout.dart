import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_market_place/models/product.dart';
import 'package:in_app_notification/in_app_notification.dart';
import '../notifikasi/page.dart';
import '../notifikasi/inapp.dart';
import '../notifikasi/notifikasi_success.dart';
import '/akun/transaksiSuccess.dart';

class CheckoutPage extends StatefulWidget {
  final double totalAmount;
  final List<Product> cartItems;

  CheckoutPage({required this.totalAmount, required this.cartItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _count = 0;
  int _duration = 3000;
  List<String> _notifications = [];

  void _incrementCount() => setState(() {
        _count++;
        _notifications.add('Pesanan $_count Berhasil');
      });
  String _messageToSeller = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Checkout', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 80),
        children: [
          _buildProductInfo(),
          _buildShippingOption(),
          _buildMessageToSeller(),
          _buildOrderSummary(),
        ],
      ),
      bottomNavigationBar: _buildOrderButton(),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      children: widget.cartItems.map((product) {
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bebas Pengembalian',
                    style: TextStyle(color: Colors.teal)),
                Text('Variasi:'),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    'Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(product.price)}'),
                Text('x${product.quantity}'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildShippingOption() {
    return ListTile(
      title: Text('Opsi Pengiriman'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hemat'),
          Text('Garansi tiba:'),
        ],
      ),
      trailing: Text('Rp0', style: TextStyle(color: Colors.teal)),
    );
  }

  Widget _buildMessageToSeller() {
    return ListTile(
      title: Text('Pesan untuk Penjual'),
      trailing: Text(
          _messageToSeller.isEmpty ? 'Tinggalkan pesan' : _messageToSeller),
      onTap: () {
        _showMessageDialog(context);
      },
    );
  }

  void _showMessageDialog(BuildContext context) {
    TextEditingController _messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pesan untuk Penjual'),
          content: TextField(
            controller: _messageController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Masukkan pesan Anda...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Kirim'),
              onPressed: () {
                setState(() {
                  _messageToSeller = _messageController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrderSummary() {
    return ListTile(
      title: Text('Total Pesanan (${widget.cartItems.length} Produk):'),
      trailing: Text(
        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(widget.totalAmount)}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOrderButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Pembayaran',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(widget.totalAmount)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionSuccessPage(
                        totalAmount: widget.totalAmount,
                        cartItems: widget.cartItems,
                    )
                ),
              );
            },
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
            child: Text(
              'Buat Pesanan',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'poppins_regular',
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
