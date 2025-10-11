import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_audio.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_image.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/timeline_video.dart';
import 'package:flutter/material.dart';

class TimelineImageController extends ChangeNotifier{
  // ----------------------
  // Media toggle state
  // ----------------------
  // String _selectedMediaOption = 'Photos';
  // final List<String> _mediaOptions = ['Photos', 'Videos', 'Audios'];
  
final List<NavItem> _navItems = [
  NavItem(label: 'Photos', screen: TimeLineImage()),
  NavItem(label: 'Videos', screen: TimelineVideo()),
  NavItem(label: 'Aduio', screen: TimeLineAudio())
];


  String _currentRoute = '/time_line_image'; 

  List<NavItem> get navItems => _navItems;
  String get currentRoute => _currentRoute;

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
  List<String> get imagePaths => List.unmodifiable(_imagePaths);

  // String get selectedOption => _selectedMediaOption;
  // @override
  // List<String> get options => List.unmodifiable(_mediaOptions);

  // @override
  // void selectOption(String option) {
  //   if (_selectedMediaOption != option && _mediaOptions.contains(option)) {
  //     _selectedMediaOption = option;
  //     notifyListeners();
  //   }
  // }
}
