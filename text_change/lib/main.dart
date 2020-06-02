import "package:flutter/material.dart";
import './TextControl.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Changer'),
        ),
        body: TextControl(),
      ),
    );
  }
}
