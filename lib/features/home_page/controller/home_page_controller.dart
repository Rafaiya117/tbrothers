import 'package:appsoleum/features/home_page/model/memory_item_model.dart';
import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  
  final List<MemoryItem> _memoryItems = [
    MemoryItem(
      imagePath: 'assets/images/wedding_image.png',
      title: 'Wedding Day',
      description: 'The best day of our lives',
      date: 'June 15, 2019',
    ),
    MemoryItem(
      imagePath: 'assets/images/wedding_image.png',
      title: 'Family Trip',
      description: 'Sunsets and smiles!',
      date: 'August 5, 2021',
    ),
    MemoryItem(
      imagePath:'assets/images/wedding_image.png',
      title: 'Graduation',
      description: 'A proud moment forever',
      date: 'May 20, 2020',
    ),
  ];

  List<MemoryItem> get memoryItems => _memoryItems;

  void addMemory(MemoryItem item) {
    _memoryItems.add(item);
    notifyListeners();
  }

  void onNavItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
