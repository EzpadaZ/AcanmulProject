//google maps screen.
import 'package:acanmul_app/backend/gms/Directions.dart';
import 'package:acanmul_app/backend/gms/directions_repo.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final List<Ubicacion> ubicaciones;
  MapScreen({@required this.ubicaciones});
  @override
  _MapScreenState createState() => _MapScreenState();
}

/*
  * Esta clase muestra el mapa y tengo la intencion de que muestre los datos del paquete (asi como la ruta con las polylines)
  * Todavia no tiene constructorasi que solo muestra una ubicacion de tipo demo.
  */
class _MapScreenState extends State<MapScreen> {
  static const _demoCameraPos =
      CameraPosition(target: LatLng(19.826281, -90.527424), zoom: 9);
  GoogleMapController _googleMapController;
  Directions _directions;

  @override
  void dispose() {
    _googleMapController.dispose();
    print('Map Screen Disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _setMarkerArray(),
      builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasData){
          final markers = snapshot.data as Set<Marker>;
          return buildMapView(markers);
        }else{
          return Text(snapshot.error.toString());
        }
      }
    );
  }

  buildMapView(Set<Marker> markers){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: _demoCameraPos,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: markers,
            polylines: {
              if(_directions!=null)
                Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color: kDarkAccentColor,
                  width: 4,
                  points: _directions.polyLines.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                ),
            },
        ),
        Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 40,
              child: FloatingActionButton.extended(
                label: Text('Detalles'),
                icon: Icon(Icons.attach_money, color: Colors.black,),
                backgroundColor: kTextIconColor,
                autofocus: false,
                onPressed: (){
                  _showCostsScreen(context);
                },
              ),
            )
          ],
        )],
      ),
    );
  }


  // Agregar menu a los marcadores para tiempo de espera en Hrs.
  // Tienen un onTap ESTUPIDO.

  Future<Set<Marker>> _setMarkerArray() async {
    Set<Marker> markers = {};

    Marker origenDestino = Marker(
      markerId: MarkerId('Salida/Destino'),
      position: LatLng(19.844732,-90.532825), //parque frente al manuel campos
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    markers.add(origenDestino);

    for(var item in widget.ubicaciones){
      Marker loc = Marker(
        markerId: MarkerId(item.titulo),
        infoWindow: InfoWindow(title: item.titulo),
        position: LatLng(double.parse(item.geodata[0].lat), double.parse(item.geodata[0].lng)),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
      );
      markers.add(loc);
    }

    final direc = await DirectionsRepo().getDirections(markers);
    _directions = direc;
    return markers;
  }

  void _showCostsScreen(context){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.60,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text('Detalles del Viaje', style: TextStyle(color: kPrimaryTextColor, fontSize: 20, fontWeight: FontWeight.bold)),
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
                        customRow('KM Totales (redondo):', _directions.totalDistance),
                        SizedBox(height: 15,),
                        customRow('Tiempo (Sin Espera):',_directions.totalDuration),
                        SizedBox(height: 15,),
                        customRow('Costo por KM:', _getMoneyFormat(kPricePerKm.toString())),
                        SizedBox(height: 15,),
                        customRow('Total de Entradas:', _getMoneyFormat(_getTotalAccesos().toString())),
                        SizedBox(height: 30,),
                        customRow('Costo Total (Sin espera):', _getTravelPrice()),
                        SizedBox(height: 30,),
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
                          Navigator.pop(context);
                          ScaffoldMessenger.of(bc).showSnackBar(kNotImplementedSnackBar);
                        },
                        style: OutlinedButton.styleFrom(
                            primary: kAccentColor,
                            side: BorderSide(color: kAccentColor)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.today_outlined),
                            SizedBox(width: 5,),
                            Text('Agendar Viaje')
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  int _getTotalAccesos() {
    int costoEntradas = 0;
    for(Ubicacion item in widget.ubicaciones){
      costoEntradas += int.parse(item.costoAcceso);
    }
    return costoEntradas;
  }

  String _getTravelPrice() {
    int totalaccesos = _getTotalAccesos();
    int km = int.parse(_directions.totalDistance.replaceAll('km', '').trim());
    double total = km * kPricePerKm;
    return _getMoneyFormat((total+totalaccesos).toString());
  }

  String _getMoneyFormat(String number) {
    MoneyFormatterOutput fo = FlutterMoneyFormatter(amount: double.parse(number)).output;
    return fo.symbolOnLeft + ' MXN';
  }

  Widget customRow(String label, String result){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryTextColor, fontSize: 18)),
        Text(result, style: TextStyle(fontWeight: FontWeight.bold, color: kSecondaryTextColor, fontSize: 18),)
      ],
    );
  }
}
