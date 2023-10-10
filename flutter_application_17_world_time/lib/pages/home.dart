// ignore_for_file: avoid_print

import 'dart:async';

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

  void getTime(timeZone) async {
    try {
      var urlTime = Uri.http("worldtimeapi.org", "/api/$timeZone");
      var responseTime = await http.get(urlTime);
      if (responseTime.statusCode == 200) {
        var jsonTimeResponse =
            convert.jsonDecode(responseTime.body) as Map<String, dynamic>;
        var datetime = jsonTimeResponse["datetime"];
        var offset = jsonTimeResponse["utc_offset"];
        DateTime now = DateTime.parse(datetime);
        now = now
            .add(Duration(hours: int.parse(offset.toString().substring(1, 3))));
        setState(() {
          currentDate = "${now.day}-${now.month}-${now.year}";
          currentTime = "${now.hour}:${now.minute}:${now.second}";
        });
      } else {
        print(responseTime.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> getAPIData(timeZone) async {
    try {
      var urlTime = Uri.http("worldtimeapi.org", "/api/$timeZone");
      var responseTime = await http.get(urlTime);
      if (responseTime.statusCode == 200) {
        var jsonTimeResponse =
            convert.jsonDecode(responseTime.body) as Map<String, dynamic>;
        var datetime = jsonTimeResponse["datetime"];
        var offset = jsonTimeResponse["utc_offset"];
        DateTime now = DateTime.parse(datetime);
        now = now
            .add(Duration(hours: int.parse(offset.toString().substring(1, 3))));
        return "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}:${now.second}";
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    getTime("Asia/Dhaka");
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
              FutureBuilder(
                  future: getAPIData("Asia/Dhaka"),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
