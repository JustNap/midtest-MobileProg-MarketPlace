import 'package:flutter/material.dart';
import 'package:project_market_place/products/sorting_phones.dart';
import '../products/product.dart';
import '../products/see_all_phones.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Product> topDeals = [];
  List<Product> newArrivals = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTopDeals().then((loadedProducts) {
      setState(() {
        topDeals = loadedProducts;
      });
    });

    loadNewArrivals().then((loadedProducts) {
      setState(() {
        newArrivals = loadedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Marketplace'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for phones..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.teal,
                  ),
                  // suffixIcon: Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.teal,
                  //         shape: BoxShape.circle,
                  //       ),
                  //       padding: EdgeInsets.all(8.0),
                  //       child: Icon(
                  //         Icons.camera_alt,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     SizedBox(width: 8.0),
                  //   ],
                  // ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
                onSubmitted: (query) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllPhonesPage(
                        jsonFile: 'phones.json',
                        title: 'Search Results',
                        searchQuery: query,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Carousel
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCarouselItem(Icons.category, "Sort by Name"),
                  _buildCarouselItem(Icons.request_quote, "Sort by Price"),
                  _buildCarouselItem(Icons.request_quote, "Sort by Brand"),
                ],
              ),
            ),

            // Top Deals Card
            _buildDealsSection(topDeals, "Top Deals", "Check out our best deals on phones!", 50),

            // New Arrivals Card
            _buildDealsSection(newArrivals, "New Arrivals", "Check out our exciting new arrivals today!", 70),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        if (text == "Sort by Name") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SortingPhonesPage(
                title: 'Sorting by Name',
                sortType: 'name',
                defaultSelection: 'A to Z',
                jsonFile: 'assets/phones.json',
                sortOptions: ['A to Z', 'Z to A'],
              ),
            ),
          );
        } else if (text == "Sort by Price") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SortingPhonesPage(
                title: 'Sort by Price',
                sortType: 'price',
                defaultSelection: 'Low to High',
                jsonFile: 'assets/phones.json',
                sortOptions: ['Low to High', 'High to Low'],
              ),
            ),
          );
        } else if (text == "Sort by Brand") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SortingPhonesPage(
                title: 'Sorting by Brand',
                sortType: 'brand',
                defaultSelection: 'Apple',
                jsonFile: 'assets/phones.json',
                sortOptions: ['Apple', 'Android'],
              ),
            ),
          );
        }
      },
      child: Container(
        width: 110,
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30.0,
                  color: Colors.teal,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildDealsSection(List<Product> productList, String title, String subtitle, double heightSubtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: heightSubtitle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Change text color to white for better contrast
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 14, color: Colors.black), // Change text color to white for better contrast
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextButton.icon(
                    onPressed: () {
                      String jsonFile = "Default";
                      if (title == "Top Deals") {
                        jsonFile = 'topDealsMore.json';
                      } else if (title == "New Arrivals") {
                        jsonFile = 'newArrivalsMore.json';
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllPhonesPage(jsonFile: jsonFile, title: title),
                        ),
                      );
                    },
                    label: Text(
                      'See more',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.only(top: 4.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: productList.map((product) {
                  return _buildProductCard(product.name, product.imagePath, product.price);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String imageUrl, int price) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Image.asset(imageUrl, height: 80, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Rp ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(price)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Product>> loadTopDeals() async {
    String data = await rootBundle.loadString('assets/topDealsPhones.json');
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

  Future<List<Product>> loadNewArrivals() async {
    String data = await rootBundle.loadString('assets/newArrivalsPhones.json');
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
}
