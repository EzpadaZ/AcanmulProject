import 'package:flutter/material.dart';

class ReusablePreview extends StatelessWidget {
  ReusablePreview({
    @required this.imagen,
    @required this.nombreLugar,
  });

  final String imagen;
  final String nombreLugar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imagen,
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
                  nombreLugar,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
