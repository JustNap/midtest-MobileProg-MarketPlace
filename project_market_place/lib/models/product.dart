class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  int quantity;
  bool isSelected;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.quantity = 1,
    this.isSelected = true,
  });
  double get totalPrice => price * quantity;
}