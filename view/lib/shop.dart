import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartPage.dart';
import 'package:flutter_application_1/products.dart';
import 'login_page.dart'; // Импортируем страницу входа

class ShoppingCart {
  List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
  }

  void removeProduct(Product product) {
    items.remove(product);
  }

  double get totalPrice =>
      items.fold(0, (total, item) => total + item.price);
}

class ShopPage extends StatelessWidget {
  final IsLogin isLoggedIn;
  final ShoppingCart cart = ShoppingCart(); // Создаем корзину
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

  ShopPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
        actions: [
          if (isLoggedIn.isLogin == "T")
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {return CartPage(cartItems:  cart); })
            );
            }
          )
        ],
      ),
      body: Center(
        child: isLoggedIn.isLogin == "T" ? ProductsPage(products: products, carts:  cart) : const Text('Пожалуйста, войдите в систему.'),
      ),
      floatingActionButton: isLoggedIn.isLogin == "F"
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(isLogin: isLoggedIn, shop: this)),
                );
              },
              child: Icon(Icons.login),
            )
          : null,
    );
  }
}
