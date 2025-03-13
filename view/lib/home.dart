import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(color: Colors.red, child: Center(child: Text('Слайд 1'))),
        Container(color: Colors.green, child: Center(child: Text('Слайд 2'))),
        Container(color: Colors.blue, child: Center(child: Text('Слайд 3'))),
      ],
    );
  }
}
