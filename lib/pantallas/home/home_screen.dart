import 'package:flutter/material.dart';
import '../../backend/APIService.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();

    if (auth.isLoggedIn()) {
      // si es verdad (y validamos el token de la api, no hacemos nada)
    } else {
      // retorno al login
      Navigator.pushReplacementNamed(context,
          '/auth/login'); // <- pushReplacedNamed es para especificar una ruta sin retorno (para que no haya back pues xD)
    }

    return Container();
  }
}
