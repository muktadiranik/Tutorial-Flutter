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
          title: const Text(
            "Stateful Widget",
          ),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextInputWidget(),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String input = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
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
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.message),
            helperText: "This is a helper text",
            labelText: "Type a message",
          ),
          onChanged: (text) => changeText(text),
        ),
        Text(
          input,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}
