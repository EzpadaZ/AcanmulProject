import 'package:flutter/material.dart';
import '../../../backend/APIService.dart';
import '../../../componentes/reusable_card.dart';
import '../../../componentes/round_icon_button.dart';

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
        children: [
          SizedBox(
            height: size.height * 0.125,
          ),
          ReusableCard(
            color: Colors.grey.shade300,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black87),
                      textAlign: TextAlign.left,
                    )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(labelText: "E-Mail"),
                  ),
                ),
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
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RoundIconButton(
                    labelTxt: "Iniciar Sesion",
                    onpress: () => {
                      // nada aun.
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
