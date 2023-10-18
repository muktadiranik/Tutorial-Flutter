import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColumnStateLessWidget();
  }
}

class ColumnStateLessWidget extends StatelessWidget {
  const ColumnStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column StateLess Widget"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(150.0, 10.0, 150.0, 10.0),
              color: Colors.blue,
              child: Icon(
                Icons.yard_outlined,
                color: Colors.red[400],
                size: 40.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(150.0, 10.0, 150.0, 10.0),
              color: Colors.blue,
              child: Icon(
                Icons.accessibility_new_sharp,
                color: Colors.green[400],
                size: 40.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(150.0, 10.0, 150.0, 10.0),
              color: Colors.blue,
              child: Icon(
                Icons.accessibility_new_sharp,
                color: Colors.yellow[300],
                size: 40.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(150.0, 10.0, 150.0, 10.0),
              color: Colors.blue,
              child: const Icon(
                Icons.accessibility_new_sharp,
                color: Colors.amber,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
