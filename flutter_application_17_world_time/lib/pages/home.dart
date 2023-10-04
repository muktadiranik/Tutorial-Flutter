// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentDate = "";
  var currentTime = "";

  void getTime() async {
    var urlTime = Uri.http("worldtimeapi.org", "/api/Asia/Dhaka");
    var responseTime = await http.get(urlTime);
    if (responseTime.statusCode == 200) {
      var jsonTimeResponse =
          convert.jsonDecode(responseTime.body) as Map<String, dynamic>;
      print(jsonTimeResponse);
      var datetime = jsonTimeResponse["datetime"];
      var offset = jsonTimeResponse["utc_offset"];
      print("$datetime, $offset");
      DateTime now = DateTime.parse(datetime);
      print(now);
      currentDate = "${now.day}-${now.month}-${now.year}";
      currentTime = "${now.hour}:${now.minute}:${now.second}";
    } else {
      print(responseTime.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text("Choose Location")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getTime();
                    });
                  },
                  child: const Icon(Icons.refresh)),
              Text(
                currentDate,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                currentTime,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
