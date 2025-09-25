import 'package:flutter/material.dart';

class ProfileSettingsMenuController extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onNavItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}