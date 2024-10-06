import 'package:flutter/material.dart';
import '../products/product.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AllPhonesPage extends StatelessWidget {
  final String jsonFile;
  final String title;
  final String searchQuery;

  AllPhonesPage({required this.jsonFile, required this.title, this.searchQuery = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Product>>(
        future: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found.'));
          }

          // Dapatkan data produk
          var products = snapshot.data!;

          // Filter produk berdasarkan searchQuery
          if (searchQuery.isNotEmpty) {
            products = products.where((product) {
              return product.name.toLowerCase().contains(searchQuery.toLowerCase());
            }).toList();
          }

          // Jika tidak ada produk yang cocok dengan pencarian
          if (products.isEmpty) {
            return Center(child: Text('No products found.'));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(product.name, product.imagePath, product.price);
              },
            ),
          );
        },
      ),
    );
  }

  Future<List<Product>> loadProducts() async {
    String data = await rootBundle.loadString('assets/$jsonFile');
    List<dynamic> jsonResult = json.decode(data);

    List<Product> products = jsonResult.map((product) {
      return Product(
        imagePath: product['imagePath'],
        name: product['name'],
        price: product['price'],
      );
    }).toList();

    return products;
  }

  Widget _buildProductCard(String name, String imageUrl, int price) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 150,
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Add top padding here
                child: Image.asset(imageUrl, height: 80, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
                child: Column(
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Rp.${price.toStringAsFixed(0)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
