import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
          title: const Text("API ToDo"),
          centerTitle: true,
        ),
        body: const APIToDoWidget(),
      ),
    );
  }
}

class APIToDoWidget extends StatefulWidget {
  const APIToDoWidget({super.key});

  @override
  State<APIToDoWidget> createState() => _APIToDoWidgetState();
}

class _APIToDoWidgetState extends State<APIToDoWidget> {
  final controller = TextEditingController();
  List listAPI = [];
  List list = [];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getAPIData() async {
    var url = Uri.http("localhost:8000", "/list/");
    var response = await http.get(url);
    var responseJson = convert.jsonDecode(response.body);
    for (var i = 0; i < responseJson.length; i++) {
      print(responseJson[i]);
      listAPI.add(responseJson[i]);
    }
    setState(() {
      list = listAPI;
    });
  }

  void addAPIData() async {
    var url = Uri.http("localhost:8000", "/list/");
    var response = await http.post(url, body: {"body": controller.text});
    var responseJson = convert.jsonDecode(response.body);
    listAPI.add(responseJson);
    setState(() {
      list = listAPI;
    });
    controller.clear();
  }

  void deleteAPIData(id) async {
    var url = Uri.http("localhost:8000", "/list/$id/");
    var response = await http.delete(url);
    if (response.statusCode == 204) {
      listAPI.clear();
      list.clear();
      getAPIData();
    }
  }

  @override
  void initState() {
    super.initState();
    getAPIData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.message),
                suffix: IconButton(
                    onPressed: addAPIData, icon: const Icon(Icons.send))),
          ),
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        list[index]["body"],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        list[index]["created"],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            onPressed: () => {deleteAPIData(list[index]["id"])},
                            icon: const Icon(Icons.delete))),
                  ),
                ],
              );
            },
            shrinkWrap: true,
          ),
        ]),
      ),
    );
  }
}
