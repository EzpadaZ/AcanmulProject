import 'package:flutter/material.dart';
import 'package:acanmul_app/componentes/datos_perfil.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

// AHORITA REGRESO.

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Container(
          alignment:AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.all(20.0),
        
            child: Text('Mi Perfil',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0)),
        ),
      ),

        DatosPerfil(label: 'Nombre:', informacion: 'Juanito',),
        DatosPerfil(label: 'Email:', informacion: 'example@me.com',)
        
      ],

    );
    
    
    
  }
}