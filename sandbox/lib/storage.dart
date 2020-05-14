import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _prefs;

class SignInInfo {
  final String accessToken;
  final String idToken;

  SignInInfo(this.accessToken, this.idToken);
}

void logout() async {
  _prefs = await SharedPreferences.getInstance();
  _prefs.clear();
}

void storeSignInInfo(String accessToken, String idToken) async {
  _prefs = await SharedPreferences.getInstance();
  _prefs.setString("accessToken", accessToken);
  _prefs.setString("idToken", idToken);
}

Future<SignInInfo> retrieveSignInInfo() async {
  _prefs = await SharedPreferences.getInstance();
  String accessToken = _prefs.getString("accessToken");
  String idToken = _prefs.getString("idToken");
  if (accessToken == null || idToken == null) return null;
  return new SignInInfo(accessToken, idToken);
}
