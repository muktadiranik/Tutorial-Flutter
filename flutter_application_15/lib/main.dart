import 'package:flutter/material.dart';
import 'vehicles.dart';

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
    Vehicle("Car", "Car"),
    Vehicle("Truck", "Truck"),
    Vehicle("Motorcycle", "Motorcycle"),
    Vehicle("Bicycle", "Bicycle"),
    Vehicle("Bus", "Bus"),
    Vehicle("Scooter", "Scooter"),
    Vehicle("Van", "Van"),
    Vehicle("Boat", "Boat"),
    Vehicle("Airplane", "Airplane"),
    Vehicle("Helicopter", "Helicopter"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Vehicles'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: vehicles
                .map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e.type,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
