import 'package:flutter/material.dart';

// Pagina de contacto, no se que hace esto aun asi que sera un statelesswidget.
class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('Contacto',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0)),
      ),
    );
  }
}
