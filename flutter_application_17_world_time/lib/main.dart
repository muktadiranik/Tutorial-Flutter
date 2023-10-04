import 'package:flutter/material.dart';
import "package:flutter_application_17_world_time/pages/home.dart";
import "package:flutter_application_17_world_time/pages/loading.dart";
import "package:flutter_application_17_world_time/pages/choose_location.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const ChooseLocation(),
      },
    );
  }
}
