import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:acanmul_app/componentes/constants.dart';

class DetailsView extends StatelessWidget {
  Paquete paquete;
  List<Widget> imageSlider = [];

  DetailsView({this.paquete});

  void inicializarSlider() {
    imageSlider = paquete.ubicaciones
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imagen,
                            fit: BoxFit.fitWidth, width: 1200.0),
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
    inicializarSlider();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          leading: IconButton(
            splashRadius: 0.1,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
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
                    "\$8,000,000",
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Ver costo y ruta'),
        icon: Icon(Icons.add_location_alt),
        backgroundColor: kTextIconColor,
        autofocus: false,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(kNotImplementedSnackBar);
        },
      ),
    );
  }
}
