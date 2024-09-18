import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartProvider.cartItems[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.removeProductFromCart(product);
              },
            ),
          );
        },
      ),
    );
  }
}
