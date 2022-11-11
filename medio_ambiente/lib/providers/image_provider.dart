import 'package:flutter/material.dart';

class ImgProvider extends ChangeNotifier {
  String _img = '';

  String get img {
    return _img;
  }

  set img(String i) {
    _img = i;
    notifyListeners();
  }
}
