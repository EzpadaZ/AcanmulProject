import 'package:flutter/material.dart';

// Vista principal.
// Falta llamar el backend para obtener informacion de la vista (y tambien falta la interfaz obviamente)

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

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
        horizontalScroller(context)
      ],
    );
  }
}

horizontalScroller(BuildContext context) {
  return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: Text("Pronto :v"));
}
