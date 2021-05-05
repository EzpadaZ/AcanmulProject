import 'package:acanmul_app/backend/services/AuthService.dart';
import 'package:acanmul_app/pantallas/home/home_views/home_custom_travel.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import './home_views/home_main.dart';
import './home_views/home_profile.dart';
import './home_views/home_contact.dart';
import 'home_views/debug_screen.dart';

class HomeScreen extends StatefulWidget {
  //damian was here :v
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/**
 * PackageService, UbicacionService
 * ---------------------------------------------------
 * Necesitan ser instanciados en singleton o instanciados aqui
 * y pasar sus referencias mas adelantes para evitar el error de 
 * carga inicial del MainView();
 */

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  int _selectedIndex = 1;

  static List<Widget> vistas = <Widget>[
    ProfileView(),
    MainView(),
    CustomTravelView(),
    ContactView(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: vistas.elementAt(_selectedIndex)),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Perfil')),
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Principal')),
          SalomonBottomBarItem(icon: Icon(Icons.map_outlined), title: Text('Personalizado')),
          SalomonBottomBarItem(icon: Icon(Icons.phone), title: Text('Contacto')),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
