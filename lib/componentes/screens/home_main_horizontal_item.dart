import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:acanmul_app/pantallas/home/home_views/home_package_details.dart';
import 'package:flutter/material.dart';

class HorizontalItem extends StatelessWidget {
  final Paquete paquete;

  HorizontalItem({this.paquete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsView(
                      paquete: paquete,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 250,
          width: 140,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    paquete.imagen,
                    height: 168.0,
                    width: 140.0,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 7.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  paquete.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
