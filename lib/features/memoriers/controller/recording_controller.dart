import 'package:appsoleum/features/memoriers/model/recording_model.dart';
import 'package:flutter/material.dart';

class RecordMediaController extends ChangeNotifier {
  RecordMediaModel _model = RecordMediaModel();

  RecordMediaModel get model => _model;

  void toggleRecording() {
    _model = _model.copyWith(isRecording: !_model.isRecording);
    notifyListeners();
  }

  void switchTab(bool isAudio) {
    _model = _model.copyWith(isAudioMode: isAudio);
    notifyListeners();
  }
}
