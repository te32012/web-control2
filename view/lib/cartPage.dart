import 'package:flutter/material.dart';
import 'package:flutter_application_1/products.dart';
import 'package:flutter_application_1/shop.dart';

// Модель товара
class ProductCart {
  Product name;
  int quantity;

  ProductCart({required this.name, this.quantity = 1});
}

class CartPage extends StatefulWidget {

  ShoppingCart cartItems = ShoppingCart();

  CartPage({super.key, required this.cartItems});
  _CartPageState cnst() {
    List<ProductCart> prodcart = [];
    for(var cart in cartItems.items) {
      prodcart.add(ProductCart(name: cart));
    }
    return _CartPageState(cartItems: prodcart);
  }

  @override
  _CartPageState createState() => cnst();
}

class _CartPageState extends State<CartPage> {
  List<ProductCart> cartItems = [];

  _CartPageState({required this.cartItems});

  void _increaseQuantity(ProductCart product) {
    setState(() {
      product.quantity++;
    });
  }

  void _decreaseQuantity(ProductCart product) {
    setState(() {
      if (product.quantity >= 1) {
        product.quantity--;
      }
      if (product.quantity == 0) {
        cartItems.removeWhere((item) => item == product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          ProductCart product = cartItems[index];
          return Card(
            child: ListTile(
              title: Text(product.name.name),
              subtitle: Text('Цена: ${product.name.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => _decreaseQuantity(product),
                  ),
                  Text('${product.quantity}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _increaseQuantity(product),
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
