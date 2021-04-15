import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final AuthService _authService = AuthService._internal();
  final String backendUrl =
      '192.168.1.159:5000'; // cambia esto si necesitas apuntar a tu propia computadora.

  // Este header es un header default. cuando estemos logueados usaremos otro header que contenga el Bearer token para auth en la api.
  final loginHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();
  // Singleton para uso en todas las visas (o almenos las que requieren auth, como la primera.)

  void signUp(
      String nombre, String email, String password, String telefono) async {}

  // Devuelve la password en md5 hash para mas seguridad.
  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  /* 
    Este metodo ya funciona, se comunica con el backend y manda email y pwd a verificar, retornando el token de acceso (en caso de no tenerlo.)
  */
  Future<bool> login(String email, String password) async {
    Map<String, dynamic> authInfo = {'email': email, 'password': password};

    http.Response response = await http.post(
        Uri.http('192.168.1.159:5000', 'auth/login'),
        headers: loginHeader,
        body: json.encode(authInfo));

    if (response.statusCode == 202) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print(json['login']);
      print(json['token']);
      return true;
    } else {
      print('pos no');
      return false;
    }
  }

  bool isLoggedIn() {
    // Este metodo debe checar la existencia de un archivo llamado 'api_token.txt' en la carpeta del dispositivo
    // Si se encuentra esa carpeta leemos el token y lo validamos con el backend, de ser valido retornamos true.
    //
    // Cualquier otro caso, ya sea no encontrar el archivo o no validar el token lo mandamos alv.

    // if (leerArchivo() != 'notoken') {
    //   // validamos token con backend, no se como

    //   return true;
    // }

    return false;
  }
}
