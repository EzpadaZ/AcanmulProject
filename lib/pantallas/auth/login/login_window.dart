import 'package:flutter/material.dart';

class LoginWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    ));
  }
}
