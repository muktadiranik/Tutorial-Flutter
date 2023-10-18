import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Hello World",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Text(
                "Hello World",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Text(
                "Hello World",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/spring.jpg"),
                radius: 100.0,
              ),
              Divider(height: 50.0, color: Colors.white),
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
