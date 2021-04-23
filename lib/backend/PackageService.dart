import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class PackageService {
  // pronto :v
  static final SESSION = FlutterSession();
  static final Map<String, String> kApiHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  PackageService() {}

  dynamic getHeaderToken() async {}

  void getApiHeader() {
    getHeaderToken();
  }
  /**
   * Obtener todos los paquetes
   * Obtener 1 paquete
   * 
   * 1) Obtener todos los paquetes, iterar el JSON y hacer un mapa.
   */
}
