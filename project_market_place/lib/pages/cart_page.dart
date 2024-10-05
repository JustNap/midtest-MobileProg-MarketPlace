import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems.values.elementAt(index);
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
            subtitle: Text('Price: Rp ${product.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: product.isSelected,
                  onChanged: (bool? value) {
                    cartProvider.toggleItemSelection(product.id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (product.quantity > 1) {
                      cartProvider.updateItemQuantity(product.id, product.quantity - 1);
                    } else {
                      cartProvider.removeSingleItem(product.id);
                    }
                  },
                ),
                Text(product.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cartProvider.updateItemQuantity(product.id, product.quantity + 1);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: Rp ${cartProvider.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Check Out!'),
                    ),
                  );
                },
                child: Text('Check Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
