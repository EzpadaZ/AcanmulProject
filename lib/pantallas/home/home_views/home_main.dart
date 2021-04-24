import 'package:flutter/material.dart';
import '../../../backend/PackageService.dart';

// Vista principal.
// Falta llamar el backend para obtener informacion de la vista (y tambien falta la interfaz obviamente)

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

// FutureBuilder?
// https://stackoverflow.com/questions/52128705/flutter-dart-looping-through-json-results-length-returns-0

/**
 * Aight
 * PackageService.dart ya retorna todos los paquetes en una List<Paquete> para iterar entre todos los paquetes retornados
 * Todos los paquetes tienen sus definiciones y metodos para obtener sus cosas (titulo, desc, img, etc.)
 */

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Mas vistos",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
