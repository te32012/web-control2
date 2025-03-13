import 'package:flutter/material.dart';
import 'package:flutter_application_1/products.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Магазин')),
      body: Center(child: ProductsPage()),
    );
  }
}
