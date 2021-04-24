import 'Ubicacion.dart';
import 'Images.dart';

class Paquete {
  String titulo;
  String descripcion;
  List<Images> images = [];
  List<Ubicacion> ubicaciones = [];

  Paquete({this.titulo, this.descripcion, this.images, this.ubicaciones});

  //Se necesitan modelos para imagenes y ubicaciones.

  factory Paquete.fromJson(Map<String, dynamic> json) => Paquete(
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      images: json['images'],
      ubicaciones: json['ubicaciones']);

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'images': images,
        'ubicaciones': ubicaciones
      };
}
