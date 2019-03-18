import 'package:flutter/material.dart';
import './src/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fetch Data",
      home: Home(),
    );
  }
}