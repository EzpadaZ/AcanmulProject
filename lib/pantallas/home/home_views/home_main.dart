import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/componentes/screens/home_main_horizontal_item.dart';
import 'package:flutter/material.dart';
import '../../../backend/services/PackageService.dart';

// Vista principal.
// Falta llamar el backend para obtener informacion de la vista (y tambien falta la interfaz obviamente)
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}
// FutureBuilder?
// https://stackoverflow.com/questions/52128705/flutter-dart-looping-through-json-results-length-returns-0

/**
 * Aight
 * PackageService.dart ya retorna todos los paquetes en una List<Paquete> para iterar entre todos los paquetes retornados
 * Todos los paquetes tienen sus definiciones y metodos para obtener sus cosas (titulo, desc, img, etc.)
 */

class _MainViewState extends State<MainView> {
  List<Paquete> paquetes;
  PackageService _packageService;

  /**
   * Probablemente estoy usando el FutureBuilder mal. :v whoknows.
   */

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPkgs(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return buildMainView();
        }
      },
    );
  }

  @override
  void initState() {
    _packageService = PackageService();
    super.initState();
  }

  dynamic getPkgs() async {
    paquetes = await _packageService.getAllPackages();
  }

  buildMainView() {
    // futurebuilder mainobj
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Mas vistos",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
          ),
        ),
        buildHorizontalList(context),
      ],
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: paquetes.length,
        itemBuilder: (BuildContext context, int index) {
          return HorizontalItem(paquete: paquetes[index]);
        },
      ),
    );
  }
}
