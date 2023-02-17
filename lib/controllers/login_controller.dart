import 'package:apptestfy/services/prefs_service.dart';
import 'package:flutter/material.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? _login;
  void setLogin(String login) => _login = login;

  String? _password;
  void setPassword(String password) => _password = password;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 3));
    inLoader.value = false;

    if (_login == 'admin@bol.com.br' && _password == 'admin') {
      PrefsService.save(_login!);
      return true;
    }

    return false;
  }
}
