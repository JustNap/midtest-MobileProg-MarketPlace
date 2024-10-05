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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Riview Produk Anda',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          imagePath.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    File(imagePath),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Gambar tidak tersedia',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
          SizedBox(height: 16.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Rp$price',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 150, 136),
            ),
          ),
          SizedBox(height: 16.0),
          Divider(),
          Text(
            'Deskripsi Produk',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadProductScreen()));
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                side: BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Kembali',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}