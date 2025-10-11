import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/model/time_line_model.dart';
import 'package:appsoleum/features/gallary_and_timeline/gallery/view/gallary_view.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_view.dart';
import 'package:flutter/material.dart';

class GalleryTimelineController extends ChangeNotifier {
  //!-------------Media Toggle--------------!
  String _selectedOption = 'Gallery';
  final List<String> _options = ['Gallery', 'Timeline'];

  String get selectedOption => _selectedOption;
  List<String> get options => List.unmodifiable(_options);

  void selectOption(String option) {
    if (_selectedOption != option && _options.contains(option)) {
      _selectedOption = option;
      notifyListeners();
    }
  }

final List<NavItem> _navItems = [
  NavItem(label: 'Gallery', screen: GallaryView()),
  NavItem(label: 'Timeline', screen: TimeLineView()),
];


  String _currentRoute = '/gallary_view'; 

  List<NavItem> get navItems => _navItems;
  String get currentRoute => _currentRoute;

  void updateRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }

  //!----------Switch---------------!
  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  //!----------Navbar Selected Index----------!
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onNavItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  //!----------Timeline Entries----------!
  final List<TimelineEntry> _entries = [
    TimelineEntry(
      title: "👶 Welcome to the world,\nlittle sunshine.",
      date: "March 12, 2023",
      imageUrl: "assets/images/family.png",
      mediaType: MediaType.photo,
    ),
    TimelineEntry(
      title: "Celebrating the most\nspecial woman in our lives",
      date: "June 5, 2024",
      imageUrl: "assets/images/family.png",
      mediaType: MediaType.video,
    ),
    TimelineEntry(
      title: "Golden sun, salty breeze,\nand endless laughter.",
      date: "August 20, 2024",
      imageUrl: "assets/images/family.png",
      mediaType: MediaType.photo,
    ),
  ];

  List<TimelineEntry> get entries => List.unmodifiable(_entries);

  void addEntry(TimelineEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void removeEntry(TimelineEntry entry) {
    _entries.remove(entry);
    notifyListeners();
  }

  void clearEntries() {
    _entries.clear();
    notifyListeners();
  }
  //!----------Media Filtering----------!

}
