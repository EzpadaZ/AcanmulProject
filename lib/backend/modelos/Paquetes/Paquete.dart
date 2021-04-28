import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';

import 'Images.dart';

class Paquete {
  String id;
  String titulo;
  String descripcion;
  List<Images> images = [];
  //Ubicacion es una lista de IDs.
  List<Ubicacion> ubicaciones = [];

  Paquete(
      {this.id, this.titulo, this.descripcion, this.images, this.ubicaciones});

  //Se necesitan modelos para imagenes y ubicaciones.
  factory Paquete.fromJson(Map<String, dynamic> json) => Paquete(
      id: json['_id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      images: (json['images'] as List).map((i) => Images.fromJson(i)).toList(),
      ubicaciones: (json['ubicaciones'] as List)
          .map((i) => Ubicacion.fromJson(i))
          .toList());

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'images': images,
        'ubicaciones': ubicaciones
      };
}
