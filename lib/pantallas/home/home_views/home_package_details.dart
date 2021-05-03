import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:acanmul_app/pantallas/gms/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class DetailsView extends StatelessWidget {
  Paquete paquete;
  List<Widget> imageSlider = [];

  DetailsView({this.paquete});

  void inicializarSlider() {
    imageSlider = paquete.ubicaciones
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imagen,
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
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: (16/9),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  FloatingActionButton.extended(
                    label: Text('Ver costo y ruta'),
                    icon: Icon(Icons.commute),
                    backgroundColor: kTextIconColor,
                    autofocus: false,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MapScreen(ubicaciones: paquete.ubicaciones)
                      ));
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
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
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Ubicaciones incluidas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: paquete.ubicaciones.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                height: 50,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(paquete.ubicaciones[index].titulo,
                            textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showLocationDetails(context, paquete.ubicaciones[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Icon(Icons.add_location_alt_outlined),
                                  SizedBox(width: 5,),
                                  Text('Ver Mas')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _showLocationDetails(context, Ubicacion details){
    showModalBottomSheet(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (BuildContext bc){
        return Container(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(details.titulo,
                    style: TextStyle(color: kTextIconColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel, color: kAccentColor, size: 25),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        children: [
                          Text('Significado', style: TextStyle(fontWeight: FontWeight.bold, fontSize:18),),
                          SizedBox(height: 5,),
                          Text(details.significado, softWrap: true,),
                          SizedBox(height: 10,),
                          Text('Acceso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5,),
                          Text(details.acceso, softWrap: true,),
                          SizedBox(height: 10,),
                          Text('Horario', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5,),
                          Text(details.horario, softWrap: true,),
                          SizedBox(height: 10,),
                          Row(children: [
                            Text('Costo de Entrada: ', style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                            Text(_getMoneyFormat(details.costoAcceso),style: TextStyle(fontWeight: FontWeight.bold),)
                          ],)
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  
  String _getMoneyFormat(String number){
    MoneyFormatterOutput fo = FlutterMoneyFormatter(amount: double.parse(number)).output;
    return fo.symbolOnLeft + ' MXN';
  }
}
