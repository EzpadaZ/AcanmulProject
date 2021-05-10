import 'package:acanmul_app/backend/modelos/User/User.dart';
import 'package:acanmul_app/backend/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/componentes/screens/datos_perfil.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

// AHORITA REGRESO.

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _obtenerInfo(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final user = snapshot.data as User;
          return buildProfileView(user);
        } else {
          return Container(
            child: Center(
              child: Column(
                children: [
                  Text('Parece que tu token tiene un problema.'),
                  TextButton(
                    onPressed: () {
                      AuthService.removeToken();
                      Navigator.pushReplacementNamed(context, '/auth/login');
                    },
                    child: Text('Salida de Emergencia'),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  buildProfileView(User a) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Mi Perfil',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0)),
          ),
        ),
        DatosPerfil(
          label: 'Nombre:',
          informacion: a.name,
        ),
        DatosPerfil(
          label: 'Email:',
          informacion: a.email,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
              onPressed: () {
                // cerrar sesion.
                AuthService.removeToken();
                Navigator.pushReplacementNamed(context, '/auth/login');
              },
              style: OutlinedButton.styleFrom(
                  primary: Colors.red, side: BorderSide(color: Colors.red)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Cerrar Sesion')
                ],
              )),
        )
      ],
    );
  }

  Future<User> _obtenerInfo() async {
    return await AuthService.getCurrentUser();
  }
}
