import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import '../componentes/constants.dart';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final SESSION = FlutterSession();

  Future<dynamic> register(
      String name, String email, String password, String phone) async {
    try {
      var res = await http.post(Uri.http(kApiBackendUrl, 'auth/signup'),
          body: {'email': email, 'password': password});
      return res?.body;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var res = await http.post(Uri.http(kApiBackendUrl, 'auth/login'),
          headers: kDefaultHeaders,
          body: jsonEncode({'email': email, 'password': password}));
      return res?.body;
    } catch (e) {
      print(e);
    }
  }

  static setToken(String token, String email) async {
    _AuthData _authData = _AuthData(token, email);
    return await SESSION.set('auth', _authData);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('auth');
  }

  static removeToken() async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token, email;
  _AuthData(this.token, this.email);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = email;
    data['email'] = email;
    return data;
  }
}
