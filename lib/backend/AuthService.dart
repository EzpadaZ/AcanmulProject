import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import '../componentes/constants.dart';
import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final SESSION = FlutterSession();

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<dynamic> register(
      String name, String email, String password, String phone) async {
    var requestBody = {
      'name': name,
      'email': email,
      'password': _generateMd5(password),
      'phone': phone
    };
    try {
      var res = await http.post(Uri.http(kApiBackendUrl, 'auth/signup'),
          headers: kDefaultHeaders, body: jsonEncode(requestBody));
      return res?.body;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(String email, String password) async {
    var requestBody = {'email': email, 'password': _generateMd5(password)};
    try {
      var res = await http.post(Uri.http(kApiBackendUrl, 'auth/login'),
          headers: kDefaultHeaders, body: jsonEncode(requestBody));
      return res?.body;
    } catch (e) {
      print(e);
    }
  }

  static setToken(String token) async {
    return await SESSION.set('auth', token);
  }

  static Future<String> getToken() async {
    return await SESSION.get('auth');
  }

  static removeToken() async {
    await SESSION.prefs.clear();
  }
}
