import 'package:acanmul_app/backend/APIService.dart';
import 'package:flutter/material.dart';
import './home_views/home_main.dart';
import './home_views/home_profile.dart';
import './home_views/home_contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  int _selectedIndex = 1;
  static List<Widget> vistas = <Widget>[
    ProfileView(),
    MainView(),
    ContactView()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: SafeArea(child: vistas.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contacto"),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        elevation: 5,
        iconSize: 40,
        onTap: _onItemTap,
      ),
    );
  }
}
