import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop.dart';

class LoginPage extends StatefulWidget {
  final IsLogin isLogin;
  final ShopPage shop;

  const LoginPage({super.key, required this.isLogin, required this.shop});

  @override
  _LoginPageState createState() => _LoginPageState(isLogin, shop);
}

class IsLogin {
  String isLogin = "F";
  void login() {
    isLogin = "T";
  }
  void logout() {
    isLogin = "F";
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  final IsLogin isLogin;
  final ShopPage shop;
  _LoginPageState(this.isLogin, this.shop);

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Здесь должны быть ваши методы для проверки данных, можно добавить свои условия.
      final snackBar = SnackBar(content: Text('Вы вошли как: $username'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
      // Установка успешной авторизации
      isLogin.login();

      // Переход на страницу магазина
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => shop),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Имя пользователя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя пользователя';
                  }
                  username = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  password = value;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
