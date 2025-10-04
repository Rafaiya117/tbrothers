import 'package:flutter/material.dart';

class MemoryController extends ChangeNotifier{
  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;

  void onNavItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}