import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double a = 0;
  double b = 0;
  String c = "";
  String operation = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              c,
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}1";
                      });
                    },
                    child: const Text("1"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}2";
                      });
                    },
                    child: const Text("2"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}3";
                      });
                    },
                    child: const Text("3"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (a == 0) {
                          a = double.parse(c);
                        } else {
                          b = double.parse(c);
                        }
                        c = "";
                        operation = "+";
                      });
                    },
                    child: const Text("+"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}4";
                      });
                    },
                    child: const Text("4"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}5";
                      });
                    },
                    child: const Text("5"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}6";
                      });
                    },
                    child: const Text("6"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (a == 0) {
                          a = double.parse(c);
                        } else {
                          b = double.parse(c);
                        }
                        c = "";
                        operation = "-";
                      });
                    },
                    child: const Text("-"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}7";
                      });
                    },
                    child: const Text("7"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}8";
                      });
                    },
                    child: const Text("8"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}9";
                      });
                    },
                    child: const Text("9"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (a == 0) {
                          a = double.parse(c);
                        } else {
                          b = double.parse(c);
                        }
                        c = "";
                        operation = "*";
                      });
                    },
                    child: const Text("*"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "$c.";
                      });
                    },
                    child: const Text("."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c = "${c}0";
                      });
                    },
                    child: const Text("0"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        b = double.parse(c);
                        switch (operation) {
                          case "+":
                            c = (a + b).toString();
                            break;
                          case "-":
                            c = (a - b).toString();
                            break;
                          case "*":
                            c = (a * b).toString();
                            break;
                          case "/":
                            c = (a / b).toString();
                            break;
                          default:
                        }
                        c = (a + b).toString();
                      });
                    },
                    child: const Text("="),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (a == 0) {
                          a = double.parse(c);
                        } else {
                          b = double.parse(c);
                        }
                        c = "";
                        operation = "/";
                      });
                    },
                    child: const Text("/"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        a = 0;
                        b = 0;
                        c = "";
                        operation = "";
                      });
                    },
                    child: const Text("C"),
                  ),
                ),
              ],
            ),
            Row(children: [
              Text(
                "$a",
                style: const TextStyle(fontSize: 30),
              ),
              Text(operation, style: const TextStyle(fontSize: 30)),
              Text("$b", style: const TextStyle(fontSize: 30))
            ])
          ],
        )),
      )),
    );
  }
}
