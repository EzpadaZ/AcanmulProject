import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:acanmul_app/componentes/constants.dart';
import 'dart:convert';
import 'package:acanmul_app/backend/modelos/Ubicacion/Ubicacion.dart';

class UbicacionService {
  static final SESSION = FlutterSession();
  static final Map<String, String> kApiHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  UbicacionService() {
    _getAuthHeaderToken();
  }

  dynamic _getAuthHeaderToken() async {
    dynamic token = await SESSION.get('auth');
    kApiHeader['auth-token'] = token;
  }

  dynamic getLocationData(String id) async {
    // pide a la api la informacion al endpoint de /api/ubicacion/:Id

    try {
      var res = await http.get(Uri.http(kApiBackendUrl, 'api/ubicacion/' + id),
          headers: kApiHeader);

      var decodedAnswer = jsonDecode(res.body);

      Ubicacion encontrada = Ubicacion.fromJson(decodedAnswer);
      print(encontrada.titulo);
      print(encontrada.description);
      print(encontrada.geodata[0].lat);
      print(encontrada.geodata[0].lng);
    } catch (err) {
      print(err);
    }
  }
}
