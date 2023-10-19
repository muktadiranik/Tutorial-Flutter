import 'package:flutter/material.dart';

const list = ['One', 'Two', 'Three', 'Four'];

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
          child: DropDownButton(),
        ),
      ),
    );
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      onChanged: (value) {
        setState(() {
          dropDownValue = value!;
        });
      },
      items: list.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
