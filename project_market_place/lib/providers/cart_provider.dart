import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    return _items.values
        .where((item) => item.isSelected)
        .fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void updateItemQuantity(String productId, int newQuantity) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingProduct) {
        return Product(
          id: existingProduct.id,
          name: existingProduct.name,
          price: existingProduct.price,
          imageUrl: existingProduct.imageUrl,
          description: existingProduct.description,
          quantity: newQuantity,
          isSelected: existingProduct.isSelected,
        );
      });
      notifyListeners();
      saveCart();
    }
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existingProduct) {
        return Product(
          id: existingProduct.id,
          name: existingProduct.name,
          price: existingProduct.price,
          imageUrl: existingProduct.imageUrl,
          description: existingProduct.description,
          quantity: existingProduct.quantity + 1,
          isSelected: existingProduct.isSelected,
        );
      });
    } else {
      _items.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
    saveCart();
  }

  void removeSingleItem(String productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
      saveCart();
    }
  }

  void toggleItemSelection(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingProduct) {
        return Product(
          id: existingProduct.id,
          name: existingProduct.name,
          price: existingProduct.price,
          imageUrl: existingProduct.imageUrl,
          description: existingProduct.description,
          quantity: existingProduct.quantity,
          isSelected: !existingProduct.isSelected,
        );
      });
      notifyListeners();
      saveCart();
    }
  }

  Future<void> clearCart() async {
    _items = {};
    notifyListeners();
    await saveCart();
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = json.encode(_items.map((key, product) => MapEntry(key, {
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'quantity': product.quantity,
          'isSelected': product.isSelected,
        })));
    await prefs.setString('cartItems', cartData);
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('cartItems')) {
      final extractedCart = json.decode(prefs.getString('cartItems')!);
      _items = (extractedCart as Map<String, dynamic>).map((key, item) {
        return MapEntry(
          key,
          Product(
            id: item['id'],
            name: item['name'],
            price: item['price'],
            imageUrl: item['imageUrl'],
            description: item['description'],
            quantity: item['quantity'],
            isSelected: item['isSelected'] ?? true,
          ),
        );
      });
      notifyListeners();
    }
  }
}