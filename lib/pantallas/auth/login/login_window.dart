import 'package:flutter/material.dart';
import '../../../componentes/screens/reusable_card.dart';
import '../../../componentes/constants.dart';
import '../../../backend/services/AuthService.dart';
import 'dart:convert';

class LoginWindow extends StatefulWidget {
  @override
  _LoginWindowState createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final AuthService authService =
      AuthService(); // sisi, no se usa aun, pero pronto. :v quiza no en la master branch.

  var authInfo;

  dynamic login(BuildContext context) async {
    authInfo = AuthService();
    final res = await authInfo.login(
        emailTextController.text, passwordTextController.text);

    var data = jsonDecode(res) as Map<String, dynamic>;

    if (data['status'] == 200) {
      print("Status 200 Received.");
      AuthService.setToken(data['token']);
      Navigator.pushReplacementNamed(context, '/home');
      return data;
    }
  }

  @override
  void dispose() {
    emailTextController = null;
    passwordTextController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.11,
          ),
          ReusableCard(
            color: kLightAccentColor,
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
                      style: TextStyle(color: kPrimaryTextColor),
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                        labelStyle: TextStyle(color: kPrimaryTextColor),
                      )),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(color: kPrimaryTextColor),
                    controller: passwordTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: kPrimaryTextColor)),
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
                        style:
                            ElevatedButton.styleFrom(primary: kDarkAccentColor),
                        onPressed: () {
                          // nada aun
                          //
                          login(context);
                        },
                        child: Text('Iniciar Sesion'),
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // funcion de ir a registro.
                      Navigator.pushNamed(context, '/auth/signup');
                    },
                    child: Text(
                      'No tienes cuenta? Registrate!',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryTextColor),
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
