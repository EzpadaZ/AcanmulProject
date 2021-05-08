import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/backend/services/AuthService.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'package:acanmul_app/componentes/screen_components//home_main_horizontal_item.dart';
import 'package:flutter/material.dart';
import '../../../backend/services/PackageService.dart';
import 'package:acanmul_app/componentes/screen_components//reusable_preview.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}
// FutureBuilder?
// https://stackoverflow.com/questions/52128705/flutter-dart-looping-through-json-results-length-returns-0

class _MainViewState extends State<MainView> {
  _MainViewState();
  Future<List<Paquete>> _pkgs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pkgs,
      builder: (_, AsyncSnapshot<List<Paquete>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final paquetes = snapshot.data;
          return buildMainView(paquetes);
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _pkgs = _getPkgs();
  }

  Future<List<Paquete>> _getPkgs() async {
    //String token = await AuthService.getToken();
    return await PackageService.getAllPackages();
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      // nada pal refresh
    });
  }

  buildMainView(List<Paquete> paquetes) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mas vistos",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
            ],
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
