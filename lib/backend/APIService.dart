import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final AuthService _authService = AuthService._internal();
  bool amILoggedIn = false;
  final String apiUrl = '192.168.1.159:5000';
  final String authUrl = '192.168.1.159:5000';
  final String basuraUrl = 'jsonplaceholder.typicode.com';
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

  void apiHit() async {
    // usado para testing.
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

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
      amILoggedIn = true;
      return true;
    } else {
      print('pos no');
      amILoggedIn = false;
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

    return amILoggedIn;
  }

  //Obtiene el directorio local del dispositivo (en este caso la carpeta de documentos donde guardaremos el token.file)
  Future<String> get _localPath async {
    final folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  Future<File> get _localFile async {
    final path = _localPath;
    return File('$path/api_token.txt'); // si, no es seguro ya ni pedo Xd.
  }

  Future<String> leerArchivo() async {
    try {
      final archivo = await _localFile;
      //leemos el archivo
      String token = await archivo.readAsString();
      return token;
    } catch (e) {
      return 'notoken';
    }
  }
}
