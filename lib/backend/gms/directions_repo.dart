import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:acanmul_app/.env.dart';
import 'package:http/http.dart' as http;

import 'Directions.dart';

class DirectionsRepo {
  static const String _baseUrl = 'https://maps.googleapis.com';
  static const String _basePath = '/maps/api/directions/json?';
  var _queryParams = '';
  //https://developers.google.com/maps/documentation/directions/get-directions

  //iteramos los marcadores y armamos el request aqui, el link de arriba explica como se usa la API.
  Future<Directions> getDirections (Set<Marker> markers) async {
    _queryParams = await _fillQueryParams(markers);
    var uri = Uri();
    final response = await http.get(uri.resolve(_baseUrl+_basePath+_queryParams));
    //print(uri.toString());

    if(response.statusCode == 200){
      print("Ps, si retorno 200");
      var dca = jsonDecode(response.body);
      return Directions.fromMap(dca);
    }
    print(response.body);
    return null;
  }

  Future<String> _fillQueryParams(Set<Marker> markers) async {
    //La primera posicion siempre es el primer marcador (Salida).
    String qparams = '';
    qparams += "origin=" + markers.elementAt(0).position.latitude.toString() + "%2C" + markers.elementAt(0).position.longitude.toString();
    qparams += "&destination=" + markers.elementAt(0).position.latitude.toString() + "%2C" + markers.elementAt(0).position.longitude.toString();
    qparams += "&waypoints=";
    for (int i = 1; i<markers.length; i++){
      qparams += "via:"+markers.elementAt(i).position.latitude.toString()+"%2C"+markers.elementAt(i).position.longitude.toString()+"%7C";
    }
    qparams+="&key="+googleAPIKey;
    return qparams;
  }
}