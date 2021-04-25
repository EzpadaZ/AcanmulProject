import 'package:acanmul_app/backend/PackageService.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/componentes/constants.dart';

class TestingView extends StatefulWidget {
  @override
  _TestingViewState createState() => _TestingViewState();
}

class _TestingViewState extends State<TestingView> {
  PackageService packageService;
  List<Widget> sliderPaquetes;

  @override
  void initState() {
    packageService = PackageService();
    super.initState();
  }

  @override
  void dispose() {
    print('Vista borrada');
    super.dispose();
  }

  dynamic obtenerPaquetes() async {
    List<Paquete> paquetes = await packageService.getAllPackages();
    print(paquetes.length);
    // aight this code works.
    //mapear Paquete -> Lista de Widget?
    //Uso? https://pub.dev/packages/carousel_slider/example no c
    sliderPaquetes = paquetes
        .map((item) => Container(
              child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: [
                        Image.network(
                          item.images[0].url,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
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
                            )),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.titulo,
                              style: TextStyle(
                                  color: kTextIconColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ))
        .toList();
  }

  Widget carouselalv() {
    return CarouselSlider(
        items: sliderPaquetes,
        options: CarouselOptions(
            autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: obtenerPaquetes(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return carouselalv();
            } else {
              return carouselalv();
            }
          }),
    );
  }
}
