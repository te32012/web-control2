import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(color: Colors.red, child: const Center(child: Text('Слайд 1'))),
        Container(color: Colors.green, child: const Center(child: Text('Слайд 2'))),
        Container(color: Colors.blue, child: const Center(child: Text('Слайд 3'))),
      ],
    );
  }
}
