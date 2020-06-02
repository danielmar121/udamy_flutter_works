import 'package:flutter/material.dart';
import './TextChange.dart';

class TextControl extends StatefulWidget {
  TextControl();

  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _text = 'First String';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextChange(_text),
        RaisedButton(
          onPressed: () {
            setState(() {
              _text = 'Second String';
            });
          },
          child: Text('Change Text'),
        ),
        TextChange(_text),
      ],
    );
  }
}
