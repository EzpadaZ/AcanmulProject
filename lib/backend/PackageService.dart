import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class PackageService {
  // pronto :v
  static final SESSION = FlutterSession();
  static final Map<String, String> kApiHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  /**
   * Obtener todos los paquetes
   * Obtener 1 paquete
   * 
   * 1) Obtener todos los paquetes, iterar el JSON y hacer un mapa.
   */

  PackageService() {
    getHeaderToken();
  }

  dynamic getHeaderToken() async {
    dynamic token = await SESSION.get('auth');
    kApiHeader['auth-token'] = token;
  }
}
