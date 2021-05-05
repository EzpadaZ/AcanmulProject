import 'package:acanmul_app/backend/modelos/Paquetes/Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/componentes/screens/datos_perfil.dart';

// Pagina de contacto, no se que hace esto aun asi que sera un statelesswidget.

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

const String telefono = '981 107 6013';
const String email = 'sansores.tx256@gmail.com';

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Text('Contacto',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0)),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CircleAvatar(
                radius: 55.0,
                backgroundImage: NetworkImage(''),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                Text(
                  'Victor M. Sansore Troncoso',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'DUEÑO DE ACANMUL',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    letterSpacing: 2.7,
                  ),
                ),
              ],
            )
          ],
        ),
        DatosPerfil(label: 'Telefono:', informacion: telefono),
        DatosPerfil(label: 'Correo:', informacion: email),
      ],
    );
  }
}
