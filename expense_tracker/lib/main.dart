// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'dart:io';

List list = ["Income", "Expense"];
String hostURL = "muktadiranik.pythonanywhere.com";
String key = "";
int user = 0;

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginToAPI() async {
    try {
      var url = Uri.https(hostURL, "/auth/login/");
      var urlResponse = await http.post(url, body: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      var responseJson = convert.jsonDecode(urlResponse.body);
      if (urlResponse.statusCode == 200) {
        setState(() {
          key = responseJson["key"];
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login To Your Account"),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Provide Your Credentials",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          loginToAPI();
                        },
                        child: const Text("Login")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  var dropDownItem = list.first;
  List convertedList = [];
  List listAPI = [];
  var id = 0;
  var editFlag = false;
  double income = 0;
  double expense = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getAPIData() async {
    try {
      var url = Uri.https(hostURL, "/expense/");
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "Token $key",
      });
      var responseJson = convert.jsonDecode(response.body);
      var convertedData = [];
      for (var i = 0; i < responseJson.length; i++) {
        DateTime dateTime = DateTime.parse(responseJson[i]["created"]);
        String formattedDate = DateFormat.yMd().add_jm().format(dateTime);
        convertedData.add({
          "id": responseJson[i]["id"],
          "amount": responseJson[i]["amount"],
          "amount_type": responseJson[i]["amount_type"],
          "dateTime": formattedDate
        });
      }
      var urlIcomeExpense = Uri.https(hostURL, "/income-expense/");
      var responseIcomeExpense = await http.get(urlIcomeExpense, headers: {
        HttpHeaders.authorizationHeader: "Token $key",
      });
      var responseJsonIcomeExpense =
          convert.jsonDecode(responseIcomeExpense.body);
      var incomeAPI = responseJsonIcomeExpense["income"];
      var expenseAPI = responseJsonIcomeExpense["expense"];
      setState(() {
        listAPI = convertedData;
        dropDownItem = list.first;
        income = incomeAPI;
        expense = expenseAPI;
      });
    } catch (e) {
      print(e);
    } finally {
      controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  void addAPIData() async {
    try {
      var url = Uri.https(hostURL, "/expense/");
      await http.post(url, body: {
        "amount": controller.text,
        "amount_type": dropDownItem,
      }, headers: {
        HttpHeaders.authorizationHeader: "Token $key",
      });
    } catch (e) {
      print(e);
    } finally {
      getAPIData();
    }
  }

  void editAPIData(id) async {
    try {
      var url = Uri.https(hostURL, "/expense/$id/");
      await http.put(url, body: {
        "amount": controller.text,
        "amount_type": dropDownItem,
      }, headers: {
        HttpHeaders.authorizationHeader: "Token $key",
      });
    } catch (e) {
      print(e);
    } finally {
      editFlag = false;
      getAPIData();
    }
  }

  void sendAPIData(id) async {
    if (editFlag) {
      editAPIData(id);
    } else {
      addAPIData();
    }
  }

  void deleteAPIData(id) async {
    try {
      var url = Uri.https(hostURL, "/expense/$id/");
      await http.delete(url, headers: {
        HttpHeaders.authorizationHeader: "Token $key",
      });
    } catch (e) {
      print(e);
    } finally {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                              child: Center(
                            child: Text(
                              "Expense",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20.0),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              expense.toString(),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 20.0),
                            ),
                          ),
                          const Expanded(
                              child: Center(
                            child: Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              income.toString(),
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.input,
                              color: Colors.black,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton(
                            padding: const EdgeInsets.all(10),
                            items: list
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                dropDownItem = value.toString();
                              });
                            },
                            value: dropDownItem,
                            elevation: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                sendAPIData(id);
                              },
                              icon: const Icon(
                                Icons.save,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: listAPI.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    listAPI[index]["amount"].toString(),
                                    style: const TextStyle(fontSize: 15),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    listAPI[index]["amount_type"].toString(),
                                    style: const TextStyle(fontSize: 15),
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Text(
                                    listAPI[index]["dateTime"].toString(),
                                    style: const TextStyle(fontSize: 15),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: (() => {
                                          setState(() => {
                                                editFlag = true,
                                                id = listAPI[index]["id"],
                                                controller.text = listAPI[index]
                                                        ["amount"]
                                                    .toString(),
                                                dropDownItem = listAPI[index]
                                                    ["amount_type"]
                                              })
                                        }),
                                    icon: const Icon(Icons.edit,
                                        color: Colors.amber),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        deleteAPIData(listAPI[index]["id"]);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red)))
                            ],
                          );
                        },
                        shrinkWrap: true,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
