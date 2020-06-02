import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function indexChanger;
  final String theAnswer;

  Answer(this.indexChanger, this.theAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(
          theAnswer,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        color: Colors.deepPurple,
        onPressed: indexChanger,
      ),
    );
  }
}
