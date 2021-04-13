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
    return Container(
      child: Text('Home Screen'),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (!authService.isLoggedIn())
        Navigator.pushReplacementNamed(context, '/auth/login');
    });
  }
}
