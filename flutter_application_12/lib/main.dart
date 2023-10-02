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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Hello World!'),
          centerTitle: true,
          backgroundColor: Colors.grey[700],
          elevation: 1.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Hello World",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Hello World",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Hello World",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$counter",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/spring.jpg"),
                radius: 100.0,
              ),
              const Divider(height: 50.0, color: Colors.white),
              const Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.phone_disabled,
                    color: Colors.red,
                    size: 30.0,
                  )
                ],
              ),
              const Divider(height: 50.0, color: Colors.white),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: const Icon(Icons.plus_one),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    child: const Icon(Icons.exposure_minus_1_sharp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
