import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'dart:convert';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';

import 'AuthService.dart';

class PackageService {
  // pronto :v
  static final SESSION = FlutterSession();
  Map<String, String> kApiHeader;

  /**
   * Obtener todos los paquetes
   * Obtener 1 paquete
   * 
   * 1) Obtener todos los paquetes, iterar el JSON y hacer un mapa.
   */

  PackageService() {
    print('Package Service initiated');
  }

  dynamic getPackageInfo(String id) {
    //aqui retornare algo :v maniana
  }

  static Future<List<Paquete>> getAllPackages() async {
    // No se que debe retornar.
    // el HTTP Request retorna un JSON Array
    List<Paquete> paquetes = [];
    try {
      var res = await http.get(Uri.http(kApiBackendUrl, 'api/paquete'),
          headers: AuthService.kApiHeader);

      var decodedAnswer = jsonDecode(res.body);

      for (Map i in decodedAnswer) {
        // fk
        paquetes.add(Paquete.fromJson(i));
      }
      print("We got (amnt of pkgs): " + paquetes.length.toString());
    } catch (err) {
      print(err);
    }
    return paquetes;
  }
}
