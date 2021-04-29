//google maps screen.
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
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
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _demoCameraPos,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
    );
  }
}
