import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {

  String? _error;
  String? get error => _error;
  set error(String? value){
    _error = value;
    notifyListeners();
  }

  String? _errorPassword;
  String? get errorPassword => _errorPassword;
  set errorPassword(String? value){
    _errorPassword = value;
    notifyListeners();
  }

  String? _user = '';
  String? get user => _user;
  set user(String? value){
    _user = value;
  }

  String? _password = '';
  String? get password => _password;
  set password(String? value){
    _password = value;
  }

}
