import 'package:flutter/material.dart';

import 'package:practic/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: 'Практическое задание',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        backgroundColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
    );
  }
}
