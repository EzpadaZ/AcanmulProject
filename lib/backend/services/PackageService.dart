import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'dart:convert';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';

import 'AuthService.dart';

class PackageService {
  static final SESSION = FlutterSession();
  Map<String, String> kApiHeader;

  PackageService() {
    print('Package Service initiated');
  }

  static Future<List<Paquete>> getAllPackages() async {
    List<Paquete> paquetes = [];
    try {
      var res = await http.get(Uri.http(kApiBackendUrl, 'api/paquete'),
          headers: AuthService.kApiHeader);

      var decodedAnswer = jsonDecode(res.body);

      for (Map i in decodedAnswer) {
        // fk
        paquetes.add(Paquete.fromJson(i));
      }
      if(kDebugMode) {
        print("We got (amnt of pkgs): " + paquetes.length.toString());
      }
    } catch (err) {
      print(err);
    }
    return paquetes;
  }
}
