class Ubicacion {
  int tiempoEspera = 0;
  String titulo,
      significado,
      acceso,
      horario,
      costoAcceso,
      serviciosCercanos,
      imagen,
      tipo;
  List<GeoData> geodata = [];

  Ubicacion(
      {this.titulo,
      this.significado,
      this.acceso,
      this.horario,
      this.costoAcceso,
      this.serviciosCercanos,
      this.imagen,
      this.tipo,
      this.geodata});

  void setTiempoEspera(int horas){
    tiempoEspera = horas;
  }

  // factory // fromJson // toJson.
  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
      titulo: json['titulo'],
      significado: json['significado'],
      acceso: json['acceso'],
      horario: json['horario'],
      costoAcceso: json['costo_de_acceso'],
      serviciosCercanos: json['servicios_cercanos'],
      imagen: json['imagen'],
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
