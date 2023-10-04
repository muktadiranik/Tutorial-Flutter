// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        counter += 10;
      });
    });

    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        counter += 10;
      });
    });

    print(counter);
  }

  void getAPIData() async {
    var urlList = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var responseList = await http.get(urlList);
    if (responseList.statusCode == 200) {
      var jsonListResponse =
          convert.jsonDecode(responseList.body) as List<dynamic>;
      print("jsonResponse");
      print(jsonListResponse);
    } else {
      print("error");
      print(responseList.statusCode);
    }
    var urlDetails = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    var responseDetails = await http.get(urlDetails);
    if (responseDetails.statusCode == 200) {
      var jsonDetailsResponse =
          convert.jsonDecode(responseDetails.body) as Map<String, dynamic>;
      print("jsonResponse");
      print(jsonDetailsResponse);
    } else {
      print("error");
      print(responseDetails.statusCode);
    }
  }

  void getTime() async {
    var urlTime = Uri.http("worldtimeapi.org", "/api/Asia/Dhaka");
    var responseTime = await http.get(urlTime);
    if (responseTime.statusCode == 200) {
      var jsonTimeResponse =
          convert.jsonDecode(responseTime.body) as Map<String, dynamic>;
      print(jsonTimeResponse);
    } else {
      print(responseTime.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState");
    getData();
    getAPIData();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: const Icon(Icons.home),
                label: const Text("Home")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text(counter.toString()),
      ),
    );
  }
}
