import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Images.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/componentes/tempLugares.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsView extends StatelessWidget {
  List<Images> imagenes = [];
  Paquete paquete;
  List<Widget> imageSlider;

  DetailsView({this.paquete});

  void prepararDemo() {
    imagenes.add(Images(
        url:
            'https://culturacampeche.com/turismocultural/images/municipios/calakmul/cal.JPG'));
    imagenes.add(Images(
        url:
            'https://mexicotravelchannel.com.mx/wp-content/uploads/2021/01/calakmul-sigue-las-rutas-selvaticas-de-este-destino-en-campeche-mexico-travel-channel.jpg'));
    imagenes.add(Images(
        url:
            'https://www.inah.gob.mx/images/fotodeldia/20180919_calakmul.jpg'));

    paquete = Paquete(
        id: 'M474M3Y4',
        titulo: 'Calakmul',
        descripcion: 'aaa',
        images: imagenes,
        ubicaciones: []);
  }

    void inicializarSlider() {
    imageSlider = paquete.images
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.url,
                            fit: BoxFit.cover, width: 1200.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  Widget build(BuildContext context) {
    prepararDemo();
    inicializarSlider();
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
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: imageSlider,
          ),
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
