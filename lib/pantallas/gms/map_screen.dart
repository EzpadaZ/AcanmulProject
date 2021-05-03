//google maps screen.
import 'package:acanmul_app/backend/gms/Directions.dart';
import 'package:acanmul_app/backend/gms/directions_repo.dart';
import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:acanmul_app/componentes/constants.dart';
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
          if(_directions!=null)
            Positioned(
              top: 30.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: kDarkAccentColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6.0
                    )
                  ]
                ),
                child: Text(
                  (_directions.totalDistance +' , '+_directions.totalDuration),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            )
        ],
      ),
    );
  }
  
  Future<Set<Marker>> _setMarkerArray() async {
    Set<Marker> markers = {};

    Marker origenDestino = Marker(
      markerId: MarkerId('Salida/Destino'),
      position: LatLng(19.844732,-90.532825), //parque frente al manuel campos
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
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

    print("Total de marcadores "+ markers.length.toString());
    final direc = await DirectionsRepo().getDirections(markers);
    _directions = direc;
    return markers;
  }
}
