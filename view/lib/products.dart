import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(this.name, this.description, this.price, this.imageUrl);
}

class ProductsPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      'Товар 1',
      'Описание товара 1',
      19.99,
      'https://ae04.alicdn.com/kf/S2d83bd65792d42f5a7eb5f4bf325093ez.jpg',
    ),
    Product(
      'Товар 2',
      'Описание товара 2',
      29.99,
      'https://ae04.alicdn.com/kf/S796eea54e8ab4620a25143f17942525aU.jpg',
    ),
    Product(
      'Товар 3',
      'Описание товара 3',
      39.99,
      'https://ae04.alicdn.com/kf/Sf5febbbd20874c07a9e04c18c86c5aeaa.jpg_640x640.jpg',
    ),
    Product(
      'Товар 4',
      'Описание товара 4',
      49.99,
      'https://ae04.alicdn.com/kf/Sc495f7d3bcbe4b5bb5b96421eff1f4666.jpg',
    ),
    Product(
      'Товар 5',
      'Описание товара 5',
      59.99,
      'https://ae04.alicdn.com/kf/S450260bea8504220beb2db39cc66b25aP.jpg',
    ),
  ];

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Продукты')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  product.imageUrl,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.price.toStringAsFixed(2),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
