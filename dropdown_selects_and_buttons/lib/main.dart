// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

List list = ["Income", "Expense"];
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
          title: const Text("Expense Tracker"),
          centerTitle: true,
        ),
        body: const DropDownSelectButtonWidget(),
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
  List convertedList = [];
  List listAPI = [];
  String dropDownValue = list.first;
  var edit = false;
  var id = 0;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    var url = Uri.http("localhost:8000", "/expense/");
    var response = await http.get(url);
    var responseJson = convert.jsonDecode(response.body);
    var tempList = [];
    for (var i = 0; i < responseJson.length; i++) {
      DateTime dateTime = DateTime.parse(responseJson[i]["created"]);
      String formattedDate = DateFormat.yMd().add_jm().format(dateTime);
      tempList.add({
        "id": responseJson[i]["id"],
        "amount": responseJson[i]["amount"],
        "created": formattedDate,
        "amount_type": responseJson[i]["amount_type"]
      });
    }
    setState(() {
      convertedList = tempList;
    });
    controller.clear();
  }

  void postData() async {
    var url = Uri.http("localhost:8000", "/expense/");
    var response = await http.post(url,
        body: {"amount": controller.text, "amount_type": dropDownValue});
    convert.jsonDecode(response.body);
    getData();
  }

  void editData(x) async {
    var url = Uri.http("localhost:8000", "/expense/$x/");
    var response = await http.put(url,
        body: {"amount": controller.text, "amount_type": dropDownValue});
    convert.jsonDecode(response.body);
    getData();
  }

  void deleteData(x) async {
    var url = Uri.http("localhost:8000", "/expense/$x/");
    var response = await http.delete(url);
    print(response.statusCode);
    if (response.statusCode == 204) {
      listAPI.clear();
      list.clear();
      getData();
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "Amount",
                        prefixIcon: Icon(Icons.price_change_rounded),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 10,
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value.toString();
                            });
                          },
                          items: list.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                  Expanded(
                      child: IconButton(
                          onPressed: () => {
                                if (edit) {editData(id)} else {postData()},
                              },
                          icon: const Icon(Icons.send)))
                ],
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: convertedList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${convertedList[index]["amount"]}",
                                        style: TextStyle(
                                            color: convertedList[index]
                                                        ["amount_type"] ==
                                                    "Expense"
                                                ? Colors.red
                                                : Colors.green,
                                            fontSize: 20.0),
                                      )),
                                )),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${convertedList[index]["amount_type"]}",
                                        style: TextStyle(
                                            color: convertedList[index]
                                                        ["amount_type"] ==
                                                    "Expense"
                                                ? Colors.red
                                                : Colors.green,
                                            fontSize: 20.0),
                                      )),
                                )),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      convertedList[index]["created"],
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () => {
                                          controller.text = convertedList[index]
                                                  ["amount"]
                                              .toString(),
                                          edit = true,
                                          id = convertedList[index]["id"],
                                          setState(() {
                                            dropDownValue = convertedList[index]
                                                    ["amount_type"]
                                                .toString();
                                          })
                                        },
                                    icon: const Icon(Icons.edit))),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () => {
                                          deleteData(convertedList[index]["id"])
                                        },
                                    icon: const Icon(Icons.delete)))
                          ])
                    ],
                  );
                },
                shrinkWrap: true,
              ))
        ]),
      ),
    );
  }
}
