import 'package:flutter/material.dart';

class ProfileSettingsMenuController extends ChangeNotifier {
  TextEditingController name = TextEditingController(text: "Nicholas Smith");
  TextEditingController email = TextEditingController(text: "nicholassmith1234@gmail.com");
  TextEditingController dob = TextEditingController(text: "Mar 11, 1993");
  TextEditingController place = TextEditingController(text:"Carolado");
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onNavItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}