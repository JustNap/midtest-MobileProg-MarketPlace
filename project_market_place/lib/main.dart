import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'providers/cart_provider.dart';
import 'screens/product_list_screen.dart';
import 'pages/cart_page.dart';
import 'widgets/cart_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cartProvider = CartProvider();
  await cartProvider.loadCart();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: cartProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROJECT_MARKET_PLACE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
      routes: {
        '/cart': (context) => CartPage(),
      },
    );
  }
}
