//google maps screen.
import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:flutter/material.dart';
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
      CameraPosition(target: LatLng(19.826281, -90.527424), zoom: 11.5);
  GoogleMapController _googleMapController;

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
      body: Container(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: _demoCameraPos,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: markers,
        ),
      ),
    );
  }
  
  Future<Set<Marker>> _setMarkerArray() async {
    Set<Marker> markers = {};

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
    return markers;
  }
}
