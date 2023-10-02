import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List vehicles = [
    "Car",
    "Truck",
    "Motorcycle",
    "Bicycle",
    "Bus",
    "Scooter",
    "Van",
    "Boat",
    "Airplane",
    "Helicopter"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Main App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: vehicles
                .map((e) => Text(
                      e,
                      style: const TextStyle(fontSize: 20),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
