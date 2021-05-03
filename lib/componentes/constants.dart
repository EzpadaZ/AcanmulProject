import 'package:flutter/material.dart';

const Color kDarkAccentColor = Color(0xFF303F9F);
const Color kLightAccentColor = Color(0xFFC5CAE9);
const Color kPrimaryAccentColor = Color(0xFF3F51B5);
const Color kTextIconColor = Color(0xFFFFFFFF);
const Color kAccentColor = Color(0xFFFF5722);
const Color kPrimaryTextColor = Color(0xFF212121);
const Color kSecondaryTextColor = Color(0xFF757575);
const Color kDividerColor = Color(0xFFBDBDBD);
const Color kBlackColor = Color(0xFF000000);
const Color kGreyColor = Color(0xFF989898);
const Color kBackgroundColor = Color(0xFF303030);
const SnackBar kNotImplementedSnackBar = SnackBar(
  content: Text('Funcion no implementada'),
  duration: Duration(seconds: 2),
);
const double kPricePerKm = 8.0;
const bool kDebugMode = false;
const String kApiBackendUrl =
    '192.168.1.159:5000'; // modifica esto con el valor correspondiente.
const Map<String, String> kDefaultHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};
