import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectColor(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
