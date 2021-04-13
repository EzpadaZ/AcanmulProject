import 'package:flutter/material.dart';
import './pantallas/home/home_screen.dart';
import './pantallas/auth/login/login_window.dart';
import './pantallas/auth/signup/signup_window.dart';

void main() {
  runApp(MainLoader());
}

class MainLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) =>
          HomeScreen(), // <- HomeScreen decidira si estamos logeados o no, retornando a la ruta de /auth/login.
      '/auth/login': (context) => LoginWindow(),
      '/auth/signup': (context) => SignUpWindow(),
    });
  }
}
