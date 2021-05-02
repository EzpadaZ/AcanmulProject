import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/componentes/screens/home_main_horizontal_item.dart';
import 'package:flutter/material.dart';
import '../../../backend/services/PackageService.dart';
import 'package:acanmul_app/componentes/screens/reusable_preview.dart';

// Vista principal.
// Falta llamar el backend para obtener informacion de la vista (y tambien falta la interfaz obviamente)
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}
// FutureBuilder?
// https://stackoverflow.com/questions/52128705/flutter-dart-looping-through-json-results-length-returns-0

/// Aight
/// PackageService.dart ya retorna todos los paquetes en una List<Paquete> para iterar entre todos los paquetes retornados
/// Todos los paquetes tienen sus definiciones y metodos para obtener sus cosas (titulo, desc, img, etc.)

class _MainViewState extends State<MainView> {
  _MainViewState();
  /// Probablemente estoy usando el FutureBuilder mal. :v whoknows.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPkgs(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final paquetes = snapshot.data as List<Paquete>;
          return buildMainView(paquetes);
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }

  Future<List<Paquete>> _getPkgs() async {
    return await PackageService.getAllPackages();
  }

  buildMainView(List<Paquete> paquetes) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(
              "Mas vistos",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
            IconButton(icon: Icon(Icons.refresh_outlined, size: 35,),
            onPressed: (){
              setState(() {

              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Pagina Actualizada'),duration: Duration(seconds: 1),));
            },)],
          ),
        ),
        buildHorizontalList(context, paquetes),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Todos los paquetes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        buildVerticalList(context, paquetes)
      ],
    );
  }

  buildHorizontalList(BuildContext context, List<Paquete> paquetes) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: (paquetes == null) ? 0 : (paquetes.length ~/ 2),
        itemBuilder: (BuildContext context, int index) {
          return HorizontalItem(paquete: paquetes[index]);
        },
      ),
    );
  }

  buildVerticalList(BuildContext context, List<Paquete> paquetes) {
    List<Paquete> reverso = paquetes.reversed.toList();
    return Container(
      padding: EdgeInsets.all(20),
      height: 300.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: (paquetes == null) ? 0 : reverso.length,
        itemBuilder: (BuildContext context, int index) {
          return ReusablePreview(paquete: reverso[index]);
        },
      ),
    );
  }
}
