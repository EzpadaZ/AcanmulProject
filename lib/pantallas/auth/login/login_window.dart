import 'package:flutter/material.dart';
import '../../../backend/APIService.dart';
import '../../../componentes/reusable_card.dart';
import '../../../componentes/constants.dart';

class LoginWindow extends StatefulWidget {
  @override
  _LoginWindowState createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.11,
          ),
          ReusableCard(
            color: kPrimaryAccentColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    width: 200,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "E-Mail",
                    labelStyle: TextStyle(color: kTextIconColor),
                  )),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: kTextIconColor)),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: size.width * 0.525,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kAccentColor),
                        onPressed: () {
                          // nada aun
                          print('loginBtn');
                        },
                        child: Text('Iniciar Sesion'),
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // funcion de ir a registro.
                      print('RegisterBtn');
                    },
                    child: Text(
                      'No tienes cuenta? Registrate!',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kTextIconColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
