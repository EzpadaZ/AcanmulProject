import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'Directions.dart';

class DirectionsRepo {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';
  //https://developers.google.com/maps/documentation/directions/get-directions

  //iteramos los marcadores y armamos el request aqui, el link de arriba explica como se usa la API.
  Future<Directions> getDirections ({Set<Marker> markers}) async {

  }
}