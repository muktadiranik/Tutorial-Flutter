import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContainerStateLessWidget();
  }
}

class ContainerStateLessWidget extends StatelessWidget {
  const ContainerStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Container"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        margin: const EdgeInsets.all(20.0),
        color: Colors.grey[400],
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          color: Colors.grey[200],
          child:
              const Icon(Icons.add_a_photo, size: 150, color: Colors.blueGrey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.access_alarm, size: 28.0)),
    ));
  }
}

class ElevatedButtonStateLessWidget extends StatelessWidget {
  const ElevatedButtonStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("ElevatedButton"),
            centerTitle: true,
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.add_a_photo,
                  size: 150,
                  color: Colors.blueGrey,
                )),
          )),
    );
  }
}
