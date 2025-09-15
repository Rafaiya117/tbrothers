import 'package:appsoleum/features/gallary_and_timeline/model/video_item.dart';
import 'package:flutter/material.dart';

class TimelineVideoController extends ChangeNotifier {
  final List<VideoItem> _videoList = [
    VideoItem(
      thumbnail: 'assets/images/family.png',
      duration: '02:53',
      videoPath: 'assets/images/family.png',
    ),
    VideoItem(
      thumbnail: 'assets/images/family.png',
      duration: '01:45',
      videoPath: 'assets/images/family.png',
    ),
  ];

  List<VideoItem> get videoList => List.unmodifiable(_videoList);

  // Optional: Add methods to modify the list
  void addVideo(VideoItem video) {
    _videoList.add(video);
    notifyListeners();
  }

  void removeVideo(int index) {
    _videoList.removeAt(index);
    notifyListeners();
  }

  void clearVideos() {
    _videoList.clear();
    notifyListeners();
  }
}
