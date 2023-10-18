import 'package:flutter/material.dart';
import 'fruit_card.dart';
import "fruits.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List fruits = [
      Fruits('apple', 'red'),
      Fruits('banana', 'yellow'),
      Fruits('cherry', 'red'),
      Fruits('grapes', 'green'),
      Fruits('orange', 'orange'),
      Fruits('peach', 'yellow'),
      Fruits('pear', 'green'),
      Fruits('pineapple', 'yellow'),
      Fruits('strawberry', 'red'),
      Fruits('watermelon', 'green'),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruits'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: fruits.map((e) => FruitCard(fruits: e)).toList(),
        ),
      ),
    );
  }
}
