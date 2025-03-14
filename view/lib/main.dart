import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'home.dart';
import 'shop.dart';
import 'about.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин'),
        actions: [
          IconButton(icon: const Icon(Icons.shop), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage(isLoggedIn: IsLogin(),)));
          }),
          IconButton(icon: const Icon(Icons.info), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
          }),
          IconButton(icon: const Icon(Icons.contact_mail), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
          }),
        ],
      ),
      body: const HomeContent(),
      bottomNavigationBar: const BottomAppBar(
        child: Text('© 2023 Ваш Магазин, контакты  +1 (234) 567-890'),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Добро пожаловать в наш магазин!'));
  }
}
