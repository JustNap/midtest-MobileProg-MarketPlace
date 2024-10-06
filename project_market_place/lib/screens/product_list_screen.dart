import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_market_place/bottom_nav.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_icon.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Samsung',
      price: 14999900.0,
      imageUrl: 'assets/Gambar/samsung.jpg',
      description: 'Deskripsi :Kapan lagi ada HP Samsung murah dengan performa juara, HP yang dimaksud yaitu Galaxy M15 5G dengan chipset Dimensity 6100+ 5G. Chipset tersebut sudah bisa diandalkan untuk bermain game masa kekinian.',
    ),
    Product(
      id: '2',
      name: 'Iphone',
      price: 19999900.0,
      imageUrl: 'assets/Gambar/iphone1.jpg',
      description: 'Deskripsi :Desain menawan dengan sertifikasi IP68 Layar tajam Liquid Retina IPS SoC premium Apple A13 Bionic Konfigurasi dua kamera belakang 12 MP berkualitas Baterai 3110 mAh.',
    ),
  ];

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
        title: Text('Keranjang'),
        actions: [
          CartIcon(),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          final formattedPrice = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp ',
            decimalDigits: 0,
          ).format(product.price);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(formattedPrice),
                          SizedBox(height: 5),
                          Text(
                            product.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
