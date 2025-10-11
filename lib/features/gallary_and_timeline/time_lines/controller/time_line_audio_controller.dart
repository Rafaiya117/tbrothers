import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/controller/inmedia_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/model/audio_item.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_audio.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_image.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/timeline_video.dart';
import 'package:flutter/material.dart';

class TimeLineAudioController extends ChangeNotifier{
 
 // ----------------------
  // Media toggle state
  // ----------------------
  // String _selectedMediaOption = 'Photos';
  // final List<String> _mediaOptions = ['Photos', 'Videos', 'Audios'];

  // String get selectedOption => _selectedMediaOption;
  // List<String> get options => List.unmodifiable(_mediaOptions);

  // @override
  // void selectOption(String option) {
  //   if (_selectedMediaOption != option && _mediaOptions.contains(option)) {
  //     _selectedMediaOption = option;
  //     notifyListeners();
  //   }
  // }

final List<NavItem> _navItems = [
  NavItem(label: 'Photos', screen: TimeLineImage()),
  NavItem(label: 'Videos', screen: TimelineVideo()),
  NavItem(label: 'Aduio', screen: TimeLineAudio())
];

String _currentRoute = '/time_line_image'; 

List<NavItem> get navItems => _navItems;
String get currentRoute => _currentRoute;
  

  //!--------------Audio--------------!
  List<AudioItem> audioList = [
    AudioItem(title: "Chat with Dad", url: "audio1.mp3"),
    AudioItem(title: "Old Memories", url: "audio2.mp3"),
    AudioItem(title: "Grandma's hidden Recipe", url: "audio3.mp3"),
    AudioItem(title: "Mom's Journey: A Glimpse", url: "audio4.mp3"),
  ];

  int? _currentlyPlayingIndex;
  bool _isPlaying = false;

  int? get currentlyPlayingIndex => _currentlyPlayingIndex;
  bool get isPlaying => _isPlaying;

  void playAudio(int index) {
    _currentlyPlayingIndex = index;
    _isPlaying = true;
    // Add actual audio playback logic here
    notifyListeners();
  }

  void pauseAudio() {
    _isPlaying = false;
    // Add pause logic here
    notifyListeners();
  }

  void toggleAudio(int index) {
    if (_currentlyPlayingIndex == index && _isPlaying) {
      pauseAudio();
    } else {
      playAudio(index);
    }
  }

}