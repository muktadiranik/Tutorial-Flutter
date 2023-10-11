// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getTime(timeZone) async {
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
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "currentDate": "${now.day}-${now.month}-${now.year}",
        "currentTime": DateFormat.jm().format(now)
      });
    } else {
      print(responseTime.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getTime("Asia/Dhaka");
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
    );
  }
}
