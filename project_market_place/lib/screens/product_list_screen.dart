import 'package:flutter/material.dart';
import 'package:project_market_place/bottom_nav.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import 'cart_screen.dart';
import '../widgets/cart_icon.dart';
import 'package:intl/intl.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Samsung',
      price: 10000.0, 
      imageUrl: 'assets/Gambar/samsung.jpg',
    ),
    Product(
      id: '2',
      name: 'Iphone',
      price: 20000.0,
      imageUrl: 'assets/Gambar/iphone1.jpg',
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

          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(product.name),
            subtitle: Text(formattedPrice),
            trailing: IconButton(
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
          );
        },
      ),
    );
  }
}
