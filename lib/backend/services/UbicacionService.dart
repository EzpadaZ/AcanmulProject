import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:acanmul_app/componentes/constants.dart';
import 'dart:convert';
import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';

import 'AuthService.dart';

class UbicacionService {
  static Future<Ubicacion> getLocationData(String id) async {
    // pide a la api la informacion al endpoint de /api/ubicacion/:Id
    Ubicacion obtenida;
    try {
      var res = await http.get(Uri.http(kApiBackendUrl, 'api/ubicacion/' + id),
          headers: AuthService.kApiHeader);

      var decodedAnswer = jsonDecode(res.body);
      obtenida = Ubicacion.fromJson(decodedAnswer);
    } catch (err) {
      print(err);
    }

    if (obtenida == null) {
      //retorno una ubicacion default
      return null;
    } else {
      return obtenida;
    }
  }
}
