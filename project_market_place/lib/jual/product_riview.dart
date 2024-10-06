import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_market_place/jual/jual.dart';

class ReviewProductScreen extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String imagePath;

  const ReviewProductScreen({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text(
          'Review Produk Anda',
          style: TextStyle(
            color: Colors.teal[900],
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.teal[900]),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          imagePath.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.3),
                        blurRadius: 15.0,
                        spreadRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      File(imagePath),
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Gambar tidak tersedia',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
          SizedBox(height: 20.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.teal[900],
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              Text(
                'Rp$price',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Divider(),
          Text(
            'Deskripsi Produk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 30.0),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadProductScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal[700]!, Colors.teal[400]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
