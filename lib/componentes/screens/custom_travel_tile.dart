import 'package:acanmul_app/backend/modelos/Paquetes/Ubicacion.dart';
import 'package:flutter/material.dart';

class TravelTile extends StatefulWidget {
  Ubicacion ubicacion;
  List<Ubicacion> selected = [];

  TravelTile({this.ubicacion, this.selected});

  @override
  _TravelTileState createState() => _TravelTileState();
}

class _TravelTileState extends State<TravelTile> {
  bool _isAdded = false;
  Icon added = Icon(Icons.check, color: Colors.green,);
  Icon not_added = Icon(Icons.add, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.ubicacion.imagen,
              height: 64.0,
              width: 64.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          Column(
            children: <Widget>[
              Text(
                widget.ubicacion.titulo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Spacer(),
          IconButton(icon: _isAdded ? added : not_added, onPressed: (){
            setState(() {
              _isAdded = !_isAdded;
            });
            if(_isAdded){
              widget.selected.add(widget.ubicacion);
            }else{
              widget.selected.remove(widget.ubicacion);
            }
            print(_isAdded);
          })
        ],
      ),
    );
  }
}
