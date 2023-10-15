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
          title: (const Text('List View')),
          centerTitle: true,
        ),
        body: const ListViewWidget(),
      ),
    );
  }
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final controller = TextEditingController();
  List<String> list = [];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void appendList() {
    setState(() {
      list.add(controller.text);
      controller.clear();
    });
  }

  void removeFromList(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.type_specimen),
                suffix: IconButton(
                    onPressed: appendList, icon: const Icon(Icons.send)))),
        ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    list[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => {removeFromList(index)},
                    icon: const Icon(Icons.delete)),
              ],
            ));
          },
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        )
      ],
    );
  }
}
