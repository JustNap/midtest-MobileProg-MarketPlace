import 'package:flutter/material.dart';
class MarketplaceHomePage extends StatelessWidget {
  const MarketplaceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://via.placeholder.com/800x400.png?text=Marketplace+Banner',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem(
                      'Electronics', 'https://via.placeholder.com/100'),
                  _buildCategoryItem(
                      'Fashion', 'https://via.placeholder.com/100'),
                  _buildCategoryItem('Home', 'https://via.placeholder.com/100'),
                  _buildCategoryItem(
                      'Sports', 'https://via.placeholder.com/100'),
                ],
              ),
            ),

            // Popular Products Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Popular Products',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return _buildProductItem(
                  'Product $index',
                  'https://via.placeholder.com/200',
                  '\$${(index + 1) * 50}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Category Item
  Widget _buildCategoryItem(String name, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Widget for Product Item
  Widget _buildProductItem(String name, String imageUrl, String price) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}