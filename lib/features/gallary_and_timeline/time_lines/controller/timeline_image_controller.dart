import 'package:appsoleum/features/gallary_and_timeline/commons/controller/inmedia_controller.dart';
import 'package:flutter/material.dart';

class TimelineImageController extends ChangeNotifier
    implements IMediaToggleController {
  // ----------------------
  // Media toggle state
  // ----------------------
  String _selectedMediaOption = 'Photos';
  final List<String> _mediaOptions = ['Photos', 'Videos', 'Audios'];

  // ----------------------
  // Media content
  // ----------------------
  final List<String> _imagePaths = [
    'assets/images/family.png',
    'assets/images/family.png',
    'assets/images/family.png',
    'assets/images/family.png',
    // Add more image paths as needed
  ];

  @override
  String get selectedOption => _selectedMediaOption;

  @override
  List<String> get options => List.unmodifiable(_mediaOptions);

  List<String> get imagePaths => List.unmodifiable(_imagePaths);

  @override
  void selectOption(String option) {
    if (_selectedMediaOption != option && _mediaOptions.contains(option)) {
      _selectedMediaOption = option;
      notifyListeners();
    }
  }
}
