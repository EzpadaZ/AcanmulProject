import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:acanmul_app/backend/services/UbicacionService.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'package:acanmul_app/componentes/screens/custom_travel_tile.dart';
import 'package:acanmul_app/componentes/screens/reusable_card.dart';
import 'package:acanmul_app/pantallas/gms/map_screen.dart';
import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/material/DropdownButton-class.htmlfa

class CustomTravelView extends StatefulWidget {
  @override
  _CustomTravelViewState createState() => _CustomTravelViewState();
}

class _CustomTravelViewState extends State<CustomTravelView> {
  Future<List<Ubicacion>> _lista;
  List<Ubicacion> _ubicaciones = [];
  List<Ubicacion> _seleccionadas = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ubicacion>>(
      future: _lista,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          _ubicaciones = snapshot.data;
          return buildCustomTravelView(_ubicaciones);
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }

  void initState() {
    super.initState();
    _lista = getLocations();
  }

  Future<List<Ubicacion>> getLocations() async {
    return await UbicacionService.getAllLocations();
  }

  Future _refresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  buildCustomTravelView(List<Ubicacion> ubicaciones) {
    return RefreshIndicator(
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Crea tu ruta",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Ubicaciones Disponibles',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ReusableCard(
                        color: kPrimaryTextColor,
                        cardChild: ListView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _ubicaciones.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TravelTile(
                              ubicacion: _ubicaciones[index],
                              selected: _seleccionadas,
                            );
                          },
                        )),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          _showTravelPreview(context);
                        },
                        style: OutlinedButton.styleFrom(
                            //backgroundColor: kDarkAccentColor,
                            primary: kTextIconColor,
                            side: BorderSide(color: kTextIconColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Revisar Viaje',)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
      onRefresh: _refresh,
    );
  }

  _showTravelPreview(context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text('Detalles de Lista', style: TextStyle(color: kTextIconColor, fontSize: 20, fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(icon: Icon(Icons.cancel, color: kAccentColor, size: 25),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },)
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
                          customRow('Total de Ubicaciones:', _seleccionadas.length.toString()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: OutlinedButton(
                          onPressed: (){
                            if(_seleccionadas.length>0){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MapScreen(ubicaciones: _seleccionadas)
                              ));
                            }else{
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(kNotImplementedSnackBar);
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              primary: kTextIconColor,
                              side: BorderSide(color: kTextIconColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.today_outlined),
                              SizedBox(width: 5,),
                              Text('Revisar Ruta')
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget customRow(String label, String result){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: kTextIconColor, fontSize: 18)),
        Text(result, style: TextStyle(fontWeight: FontWeight.bold, color: kLightAccentColor, fontSize: 18),)
      ],
    );
  }
}
