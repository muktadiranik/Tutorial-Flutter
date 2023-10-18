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
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.all(5.0),
                color: Colors.amber[400],
                child: const Icon(Icons.numbers,
                    size: 50.0, color: Colors.black87),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.all(5.0),
                color: Colors.amber[400],
                child: const Icon(Icons.abc, size: 50.0, color: Colors.black87),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.all(5.0),
                color: Colors.amber[400],
                child: const Icon(Icons.one_x_mobiledata,
                    size: 50.0, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
