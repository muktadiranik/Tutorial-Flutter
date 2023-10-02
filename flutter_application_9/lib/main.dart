import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RowColumnStateLessWidget();
  }
}

class RowColumnStateLessWidget extends StatelessWidget {
  const RowColumnStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Row Column"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("1"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("2"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("3"))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("4"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("5"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("6"))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("7"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("8"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("9"))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("*"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("0"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("#"))),
                    )
                  ],
                ),
              ],
            )));
  }
}
