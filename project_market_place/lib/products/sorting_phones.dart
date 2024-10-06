import 'package:flutter/material.dart';
import '../products/product.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:intl/intl.dart';

class SortingPhonesPage extends StatefulWidget {
  final String title;
  final String sortType;
  final String defaultSelection;
  final String jsonFile;
  final List<String> sortOptions;

  SortingPhonesPage({
    required this.title,
    required this.sortType,
    required this.defaultSelection,
    required this.jsonFile,
    required this.sortOptions,
  });

  @override
  _SortingPhonesPageState createState() => _SortingPhonesPageState();
}

class _SortingPhonesPageState extends State<SortingPhonesPage> {
  List<Product> sortedProducts = [];
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultSelection;
    loadProducts();
  }

  void loadProducts() async {
    List<Product> products = await _fetchProducts();
    setState(() {
      sortedProducts = _sortProducts(products);
    });
  }

  Future<List<Product>> _fetchProducts() async {
    String data = await rootBundle.loadString('assets/phones.json');
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

  List<Product> _sortProducts(List<Product> products) {
    switch (widget.sortType) {
      case "name":
        if (dropdownValue == "A to Z") {
          products.sort((a, b) => a.name.compareTo(b.name));
        } else {
          products.sort((a, b) => b.name.compareTo(a.name));
        }
        break;

      case "price":
        if (dropdownValue == "Low to High") {
          products.sort((a, b) => a.price.compareTo(b.price));
        } else {
          products.sort((a, b) => b.price.compareTo(a.price));
        }
        break;

      case "brand":
        products = products.where((p) {
          if (dropdownValue == "Apple") {
            return p.name.toLowerCase().contains('apple');
          } else {
            return !p.name.toLowerCase().contains('apple');
          }
        }).toList();
        break;
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sort by', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              sortedProducts = _sortProducts(sortedProducts);
                              loadProducts();
                            });
                          },
                          items: widget.sortOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: sortedProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 150,
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Image.asset(sortedProducts[index].imagePath, height: 80, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
                            child: Column(
                              children: [
                                Text(
                                  sortedProducts[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Rp ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format( sortedProducts[index].price)}',
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
