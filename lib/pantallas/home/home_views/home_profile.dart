import 'package:acanmul_app/backend/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

dynamic getToken() async {
  dynamic token = await FlutterSession().get('auth');
  print(token);
}

// AHORITA REGRESO.

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          child: Text('Print Debug'),
          onPressed: () {
            getToken();
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
      ],
    );
  }
}
