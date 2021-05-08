import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:acanmul_app/componentes/constants.dart';
import 'package:flutter/material.dart';

class CustomRowInput extends StatefulWidget {
  Ubicacion item;

  CustomRowInput({this.item});
  @override
  _CustomRowInputState createState() => _CustomRowInputState();
}

class _CustomRowInputState extends State<CustomRowInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: (){
            setState(() {
              if(widget.item.tiempoEspera >= 0){
                widget.item.tiempoEspera--;
              }
            });
          },
          child: Icon(Icons.remove, color: Colors.red),
        ),
        Container(
          child: Text(widget.item.tiempoEspera.toString(), style: TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.bold),),
        ),
        TextButton(
          onPressed: (){
            setState(() {
              widget.item.tiempoEspera++;
            });
          },
          child: Icon(Icons.add, color: Colors.green),
        )
      ],
    );
  }
}
