import 'package:flutter/material.dart';
import 'vehicles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List vehicles = <Vehicle>[
      Vehicle('Car', 'Car'),
      Vehicle('Bike', 'Bike'),
      Vehicle('Truck', 'Truck'),
    ];

    Widget vehicleTemplate(vehicle) {
      return Card(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(children: [
            Text(
              vehicle.name,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              vehicle.type,
              style: const TextStyle(fontSize: 24),
            ),
          ]));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Vehicles'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: vehicles.map((e) => vehicleTemplate(e)).toList(),
        ),
      ),
    );
  }
}
