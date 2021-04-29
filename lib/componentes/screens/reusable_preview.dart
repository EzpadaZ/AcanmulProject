import 'package:acanmul_app/backend/modelos/Paquetes/Paquete.dart';
import 'package:flutter/material.dart';

class ReusablePreview extends StatelessWidget {
  Paquete paquete;

  ReusablePreview({this.paquete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // accion del boton a mandar a la vista de detalles.
        print(paquete.titulo);
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                paquete.imagen,
                height: 110.0,
                width: 110.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  paquete.titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
