import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/controller/inmedia_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/model/video_item.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_audio.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_image.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/timeline_video.dart';
import 'package:flutter/material.dart';

class TimelineVideoController extends ChangeNotifier {
  // ----------------------
  // Media toggle state
  // ----------------------
  // String _selectedMediaOption = 'Videos';
  // final List<String> _mediaOptions = ['Photos', 'Videos', 'Audios'];

  // @override
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

final List<NavItem> _navItems = [
  NavItem(label: 'Photos', screen: TimeLineImage()),
  NavItem(label: 'Videos', screen: TimelineVideo()),
  NavItem(label: 'Aduio', screen: TimeLineAudio())
];


  String _currentRoute = '/video_time_line'; 

  List<NavItem> get navItems => _navItems;
  String get currentRoute => _currentRoute;

  // ----------------------
  // Video list state
  // ----------------------
  final List<VideoItem> _videoList = [
    // VideoItem(
    //   thumbnail: 'assets/videos/video_image1.png', 
    //   duration: '02:53',
    //   videoPath: 'assets/videos/family.mp4', 
    // ),
    // VideoItem(
    //   thumbnail: 'assets/videos/video_image2.png',
    //   duration: '01:45',
    //   videoPath: 'assets/videos/family2.mp4',
    // ),
    VideoItem(
      thumbnail: 'assets/videos/video_image1.png',
      duration: '00:30',
      videoPath:'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
    VideoItem(
      thumbnail: 'assets/videos/video_image2.png',
      duration: '00:45',
      videoPath:'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
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
