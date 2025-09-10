import 'dart:io';

import 'package:flutter/material.dart';

class ProfileVideoUploaderController extends ChangeNotifier{
  File? selectedVideo;
  void onVideoPicked(File video) {
  selectedVideo = video;
  notifyListeners(); // Or update your state
}
}