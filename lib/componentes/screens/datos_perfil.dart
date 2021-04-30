import 'package:flutter/material.dart';

class DatosPerfil extends StatelessWidget {
  
  DatosPerfil({
    @required this.label,
    @required this.informacion
    });

  final String label;
  final String informacion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(         
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),          
            ),
          ),
          Expanded(
              child: Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: ListTile(
                title: Text(
                  informacion,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}