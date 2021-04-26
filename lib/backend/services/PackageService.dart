import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'dart:convert';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';

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

  void printHeader() {
    print(kApiHeader);
  }

  dynamic getHeaderToken() async {
    dynamic token = await SESSION.get('auth');
    kApiHeader['auth-token'] = token;
  }

  dynamic getPackageInfo(String id) {
    //aqui retornare algo :v maniana
  }

  dynamic getAllPackages() async {
    // No se que debe retornar.
    // el HTTP Request retorna un JSON Array
    List<Paquete> paquetes = [];
    try {
      var res = await http.get(Uri.http(kApiBackendUrl, 'api/paquete'),
          headers: kApiHeader);

      var decodedAnswer = jsonDecode(res.body);

      for (Map i in decodedAnswer) {
        // fk
        paquetes.add(Paquete.fromJson(i));
      }
      print("We got (amnt of pkgs): " + paquetes.length.toString());
      return paquetes;
    } catch (err) {
      print(err);
    }
  }
}
