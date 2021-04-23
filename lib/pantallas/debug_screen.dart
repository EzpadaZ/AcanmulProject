import 'package:acanmul_app/backend/AuthService.dart';
import 'package:acanmul_app/backend/PackageService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class DebugView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Tiene que ser llamado en la creacion del Widget.
    PackageService packageService = PackageService();

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Debug Mode',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0)),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextButton(
          child: Text('Print Debug'),
          onPressed: () {
            packageService.printHeader();
          },
        ),
        TextButton(
          child: Text(
            'End Session',
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            AuthService.removeToken();
            Navigator.pushReplacementNamed(context, '/auth/login');
          },
        ),
        TextButton(
            child: Text('See Packages'),
            onPressed: () {
              packageService.getAllPackages(); // no idea.
            })
      ],
    );
  }
}
