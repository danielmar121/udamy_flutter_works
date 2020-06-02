import 'package:flutter/material.dart';

class TextChange extends StatelessWidget {
  final String theText;

  TextChange(this.theText);

  @override
  Widget build(BuildContext context) {
    return Text(theText);
  }
}
