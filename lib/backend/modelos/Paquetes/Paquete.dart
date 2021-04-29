import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';

import 'Images.dart';

class Paquete {
  String id;
  String titulo;
  String descripcion;
  String imagen;
  //Ubicacion es una lista de IDs.
  List<Ubicacion> ubicaciones = [];

  Paquete(
      {this.id, this.titulo, this.descripcion, this.imagen, this.ubicaciones});

  //Se necesitan modelos para imagenes y ubicaciones.
  factory Paquete.fromJson(Map<String, dynamic> json) => Paquete(
      id: json['_id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      ubicaciones: (json['ubicaciones'] as List)
          .map((i) => Ubicacion.fromJson(i))
          .toList());

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'imagen': imagen,
        'ubicaciones': ubicaciones
      };
}
