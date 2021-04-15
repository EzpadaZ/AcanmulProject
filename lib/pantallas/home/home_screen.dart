import 'package:acanmul_app/backend/APIService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: Text('Salir'),
              onTap: () {
                AuthService.removeToken();
                Navigator.popAndPushNamed(context, '/auth/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
