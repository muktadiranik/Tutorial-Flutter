import 'package:flutter/material.dart';
import 'fruits.dart';

class FruitCard extends StatelessWidget {
  final Fruits fruits;

  const FruitCard({super.key, required this.fruits});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      Text(
        fruits.name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(fruits.color,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))
    ]));
  }
}
