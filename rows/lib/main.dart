import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RowStateLessWidget();
  }
}

class DemoStateLessWidget extends StatelessWidget {
  const DemoStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(120.0),
        margin: const EdgeInsets.all(20.0),
        child: const Text("Hello World!"),
      )),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    ));
  }
}

class RowStateLessWidget extends StatelessWidget {
  const RowStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Row"),
              centerTitle: true,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.abc, size: 50)),
                TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.ac_unit, size: 50.0)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.ac_unit, size: 50.0)),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.abc, size: 50)),
              ],
            )));
  }
}
