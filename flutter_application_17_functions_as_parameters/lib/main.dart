import 'package:flutter/material.dart';
import "fruits.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    List fruits = [
      Fruits('apple', 'red'),
      Fruits('banana', 'yellow'),
      Fruits('orange', 'orange'),
      Fruits('grape', 'purple'),
      Fruits('strawberry', 'red'),
      Fruits('watermelon', 'green'),
      Fruits('peach', 'yellow'),
      Fruits('cherry', 'red'),
    ];

    void deleteFruit(Fruits fruit) {
      setState(() {
        fruits.remove(fruit);
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: fruits
                .map((e) => FruitWidget(
                      key: Key(e.name),
                      fruit: e,
                      delete: () => deleteFruit(e),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class FruitWidget extends StatelessWidget {
  final Fruits fruit;
  final VoidCallback delete;

  const FruitWidget({Key? key, required this.fruit, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(children: [
          Text(
            fruit.name,
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            fruit.color,
            style: const TextStyle(fontSize: 18),
          ),
          ElevatedButton(onPressed: delete, child: const Icon(Icons.delete))
        ]));
  }
}
