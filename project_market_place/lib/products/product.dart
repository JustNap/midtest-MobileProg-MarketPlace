import 'package:intl/intl.dart';

class Product {
  final String imagePath;
  final String name;
  final int price;

  Product({required this.imagePath, required this.name, required this.price});

  String getFormattedPrice() {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return formatter.format(price);
  }
}
