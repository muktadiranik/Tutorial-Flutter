import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Demo",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1693322248761-9c337e9ae5df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1976&q=80")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Text("click"),
      ),
    );
  }
}
