import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;
  int get selectedMenuOpt => _selectMenuOpt;

  set selectedMenuOpt(int i) {
    _selectMenuOpt = i;
    notifyListeners();
  }
}
