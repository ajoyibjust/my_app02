import 'package:flutter/material.dart';

class HomeTabProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void changeTab(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
