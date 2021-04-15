import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final String labelTxt;
  final Function onpress;

  RoundIconButton({this.labelTxt, this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress, child: Text(labelTxt));
  }
}
