import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const StateLessIconButton();
  }
}

class IconStateLessWidget extends StatelessWidget {
  const IconStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World!'),
        ),
        body: const Center(
          child: Icon(
            Icons.airport_shuttle,
            size: 128.0,
            color: Colors.lightBlue,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class RaisedButtonWidget extends StatelessWidget {
  const RaisedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("RaisedButton"),
            ),
            body: Center(
                child: ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.airport_shuttle,
                size: 128.0,
              ),
            ))));
  }
}

class RaisedButtonWithIcon extends StatelessWidget {
  const RaisedButtonWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RaisedButton'),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit, color: Colors.amber),
                label: const Text("RaisedButton"))),
      ),
    );
  }
}

class StateLessIconButton extends StatelessWidget {
  const StateLessIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("StateLessIconButton"),
        centerTitle: true,
      ),
      body: Center(
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.email_sharp,
                color: Colors.green,
                size: 128,
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.abc, color: Colors.black),
      ),
    ));
  }
}
