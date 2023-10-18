// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: IconStateLessWidget(),
  ));
}

class TestStateLessWidget extends StatelessWidget {
  const TestStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text(
          "Hello World",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.blueGrey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal.shade400,
        child: const Text("click"),
      ),
    );
  }
}

class DemoStateLessWidget extends StatelessWidget {
  const DemoStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sample App"),
          backgroundColor: Colors.yellow[800],
          foregroundColor: Colors.blue[400],
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Hello World",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
                decoration: TextDecoration.underline),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Text("click",
                style: TextStyle(fontSize: 20, color: Colors.amber))));
  }
}

class ImageStateLessWidget extends StatelessWidget {
  const ImageStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Stateless Widget",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Image(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1682687982107-14492010e05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("click"),
      ),
    );
  }
}

class LocalImageStateLessWidget extends StatelessWidget {
  const LocalImageStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Local Image Stateless Widget",
            style: TextStyle(fontSize: 20, color: Colors.brown),
          ),
        ),
        body: Image.asset("assets/2.jpg"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text(
            "click",
            style: (TextStyle(fontSize: 20, color: Colors.amber)),
          ),
        ));
  }
}

class IconStateLessWidget extends StatelessWidget {
  const IconStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Stateless Widget"),
      ),
      body: const Center(
        child: Icon(Icons.wordpress_sharp, size: 100, color: Colors.teal),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
