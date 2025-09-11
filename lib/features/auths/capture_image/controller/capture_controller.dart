import 'package:flutter/material.dart';

class CaptureController extends ChangeNotifier{
  String _selectedOption = 'Picture';
  final List<String> _options = ['Picture', 'Video', 'Audio'];

  String get selectedOption => _selectedOption;
  List<String> get options => List.unmodifiable(_options);

  void selectOption(String option) {
    if (_selectedOption != option && _options.contains(option)) {
      _selectedOption = option;
      notifyListeners();
    }
  }
}