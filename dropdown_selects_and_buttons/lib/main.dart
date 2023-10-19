import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropDownSelectButtonWidget(),
        ),
      ),
    );
  }
}

class DropDownSelectButtonWidget extends StatefulWidget {
  const DropDownSelectButtonWidget({super.key});

  @override
  State<DropDownSelectButtonWidget> createState() =>
      _DropDownSelectButtonWidgetState();
}

class _DropDownSelectButtonWidgetState
    extends State<DropDownSelectButtonWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.message),
              suffix:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send))),
        )
      ],
    );
  }
}
