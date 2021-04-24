class Ubicacion {
  String titulo, description, tipo, image;
  var ubicacion;

  Ubicacion({this.titulo, this.description, this.tipo, this.image});

  // rip ;
  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        titulo: json['titulo'],
        description: json['description'],
        tipo: json['tipo'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'description': description,
        'ubicacion': ubicacion,
        'image': image
      };
}
