import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Images.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/componentes/tempLugares.dart';

class DetailsView extends StatelessWidget {
  List<Images> imagenes = [];
  Paquete paquete;

  DetailsView({this.paquete});

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

  Widget build(BuildContext context) {
    prepararDemo();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Text("Aqui va el carrusel"),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      paquete.titulo,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${lugares[0]["precio"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  )),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Detalles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  paquete.descripcion,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.directions_car,
        ),
        onPressed: () {},
      ),
    );
  }
}
