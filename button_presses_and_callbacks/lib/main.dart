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
        appBar: AppBar(
          title: const Text("Button and Input"),
          centerTitle: true,
        ),
        body: const Center(
          child: ButtonAndInputWidget(),
        ),
      ),
    );
  }
}

class ButtonAndInputWidget extends StatefulWidget {
  const ButtonAndInputWidget({super.key});

  @override
  State<ButtonAndInputWidget> createState() => _ButtonAndInputWidgetState();
}

class _ButtonAndInputWidgetState extends State<ButtonAndInputWidget> {
  final controller = TextEditingController();
  String input = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void changeInput(String text) {
    setState(() {
      input = controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.input),
              labelText: "Input Text",
              suffix: IconButton(
                  onPressed: () =>
                      {changeInput(controller.text), controller.clear()},
                  icon: const Icon(Icons.send))),
        ),
        Text(input, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
