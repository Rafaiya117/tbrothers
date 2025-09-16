import 'package:appsoleum/features/gallary_and_timeline/commons/controller/inmedia_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/model/video_item.dart';
import 'package:flutter/material.dart';

class TimelineVideoController extends ChangeNotifier
    implements IMediaToggleController {
  // ----------------------
  // Media toggle state
  // ----------------------
  String _selectedMediaOption = 'Videos';
  final List<String> _mediaOptions = ['Photos', 'Videos', 'Audios'];

  @override
  String get selectedOption => _selectedMediaOption;

  @override
  List<String> get options => List.unmodifiable(_mediaOptions);

  @override
  void selectOption(String option) {
    if (_selectedMediaOption != option && _mediaOptions.contains(option)) {
      _selectedMediaOption = option;
      notifyListeners();
    }
  }

  // ----------------------
  // Video list state
  // ----------------------
  final List<VideoItem> _videoList = [
    VideoItem(
      thumbnail: 'assets/videos/video_image1.png', 
      duration: '02:53',
      videoPath: 'assets/videos/family.mp4', 
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image2.png',
      duration: '01:45',
      videoPath: 'assets/videos/family2.mp4',
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image3.png', 
      duration: '02:53',
      videoPath: 'assets/videos/family.mp4', 
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image4.png',
      duration: '01:45',
      videoPath: 'assets/videos/family2.mp4',
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image1.png', 
      duration: '02:53',
      videoPath: 'assets/videos/family.mp4', 
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image2.png',
      duration: '01:45',
      videoPath: 'assets/videos/family2.mp4',
    ),
  ];

  List<VideoItem> get videoList => List.unmodifiable(_videoList);

}
