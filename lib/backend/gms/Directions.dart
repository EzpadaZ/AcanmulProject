import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polyLines;
  final String totalDistance;
  final String totalDuration;

  const Directions({this.bounds, this.polyLines, this.totalDistance, this.totalDuration});
}