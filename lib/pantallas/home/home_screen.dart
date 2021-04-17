import 'package:acanmul_app/backend/APIService.dart';
import 'package:flutter/material.dart';
import '../gms/map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
                child: Text('Map Demo'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapScreen()));
                })
          ],
        ),
      ),
    );
  }
}
