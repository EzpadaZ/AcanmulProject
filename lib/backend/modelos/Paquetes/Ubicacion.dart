class Ubicacion {
  String titulo, description, image, tipo;
  List<GeoData> geodata = [];

  Ubicacion(
      {this.titulo, this.description, this.image, this.tipo, this.geodata});

  // factory // fromJson // toJson.
  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
      titulo: json['titulo'],
      description: json['description'],
      image: json['image'],
      tipo: json['tipo'],
      geodata:
          (json['ubicacion'] as List).map((i) => GeoData.fromJson(i)).toList());
}

// holds lat/lng val
class GeoData {
  String lat, lng;
  GeoData({this.lat, this.lng});
  // factory / toJson.
  factory GeoData.fromJson(Map<String, dynamic> json) =>
      GeoData(lat: json['lat'], lng: json['lng']);
}
