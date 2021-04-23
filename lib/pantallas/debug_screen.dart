import 'package:acanmul_app/backend/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class DebugView extends StatelessWidget {
  dynamic getToken() async {
    dynamic token = await FlutterSession().get('auth');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
