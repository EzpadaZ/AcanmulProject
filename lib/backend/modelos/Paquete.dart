class Paquete {
  String titulo;
  String descripcion;
  var images;
  var ubicaciones;

  Paquete({this.titulo, this.descripcion, this.images, this.ubicaciones});

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
