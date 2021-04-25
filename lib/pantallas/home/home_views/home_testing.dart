import 'package:acanmul_app/backend/modelos/Paquetes/Images.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';

class TestingView extends StatelessWidget {
  List<Images> imagenes = [];
  Paquete paquete;

  TestingView({this.paquete});

  void prepararDemo() {
    imagenes.add(Images(url: 'aaaaaaa'));
    imagenes.add(Images(url: 'aaaaaaa'));
    imagenes.add(Images(url: 'aaaaaaa'));
    paquete = Paquete(
        id: 'a',
        titulo: 'titulo',
        descripcion: 'aaa',
        images: imagenes,
        ubicaciones: ['1', '2']);
  }

  @override
  Widget build(BuildContext context) {
    prepararDemo();
    return Container(
      child: Text(paquete.titulo),
    );
  }
}
