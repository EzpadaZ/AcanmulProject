import 'package:acanmul_app/backend/modelos/Paquetes/Images.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TestingView extends StatelessWidget {
<<<<<<< HEAD
  List<Images> imagenes = [];
  Paquete paquete;
  List<Widget> imageSlider;

  TestingView({this.paquete});

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
        ubicaciones: ['ubi1', 'ubi2']);
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

//child: Text(paquete.titulo),
  @override
  Widget build(BuildContext context) {
    prepararDemo();
    inicializarSlider();
    return Container(
      child: CarouselSlider(
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
=======
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('nada'),
>>>>>>> origin/master
    );
  }
}
