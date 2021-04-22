import 'package:flutter/material.dart';
import '../../../backend/APIService.dart';

// Vista principal.
// Falta llamar el backend para obtener informacion de la vista (y tambien falta la interfaz obviamente)

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Main View"));
  }
}
