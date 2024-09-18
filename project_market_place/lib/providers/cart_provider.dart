import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProductToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  int get cartCount => _cartItems.length;
}
