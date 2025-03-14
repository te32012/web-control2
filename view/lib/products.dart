import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(this.name, this.description, this.price, this.imageUrl);
}

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  ShoppingCart carts = ShoppingCart();

  ProductsPage({super.key, required this.products, required this.carts});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Set<int> selectedProducts = {}; // Множество для хранения активных индексов продуктов

  void _toggleProduct(int index) {
    setState(() {
      // Добавляем или удаляем индекс в зависимости от текущего состояния
      if (selectedProducts.contains(index)) {
        selectedProducts.remove(index);
        widget.carts.removeProduct(widget.products[index]);
      } else {
        selectedProducts.add(index);
        widget.carts.addProduct(widget.products[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Продукты')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          var product = widget.products[index];
          bool isActive = selectedProducts.contains(index); // Проверка, активен ли продукт
          return GestureDetector(
            onTap: () => _toggleProduct(index),
            child: Card(
              elevation: isActive ? 8 : 4, // Изменяем тень в зависимости от активности
              color: isActive ? Colors.lightBlueAccent : Colors.white, // Изменяем цвет фона
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
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.price.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
