import 'package:flutter/material.dart';
import '../../../backend/APIService.dart';

class LoginWindow extends StatefulWidget {
  @override
  _LoginWindowState createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  @override
  void initState() {
    super.initState();
    AuthService authService = AuthService();
  }

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
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "E-Mail"),
            ),
          ), // EMAIL-CONTENEDOR.
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          ), // CONTRASENA CONTENEDOR.
          SizedBox(
            height: size.height * 0.5,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          )
        ],
      ),
    ));
  }
}
