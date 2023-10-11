// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var currentDate = "";
  var currentTime = "";

  void getData(timeZone) async {
    var response = Uri.http("worldtimeapi.org", "/api/$timeZone");
    var responseTime = await http.get(response);
    if (responseTime.statusCode == 200) {
      var jsonTimeResponse = convert.jsonDecode(responseTime.body);
      var datetime = jsonTimeResponse["datetime"];
      var offset = jsonTimeResponse["utc_offset"];
      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offset.toString().substring(1, 3))));
      currentDate = "${now.day}-${now.month}-${now.year}";
      currentTime = "${now.hour}:${now.minute}:${now.second}";
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "currentDate": currentDate,
        "currentTime": DateFormat.jm().format(now)
      });
    } else {
      print(responseTime.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getData("Asia/Dhaka");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: Colors.red,
    )));
  }
}
