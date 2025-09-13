import 'package:flutter/material.dart';
import 'dart:async';

class RecordingController extends ChangeNotifier {
  bool _isRecording = false;
  double _progress = 0.0;

  static const Duration maxDuration = Duration(seconds: 15);
  Timer? _timer;

  bool get isRecording => _isRecording;
  double get progress => _progress;

  void record() {
    if (_isRecording) {
      _stopRecording();
    } else {
      _startRecording();
    }
  }

  void _startRecording() {
    _isRecording = true;
    _progress = 0.0;

    const tick = Duration(milliseconds: 100);
    int totalTicks = maxDuration.inMilliseconds ~/ tick.inMilliseconds;
    int currentTick = 0;

    _timer = Timer.periodic(tick, (timer) {
      currentTick++;
      _progress = currentTick / totalTicks;

      if (_progress >= 1.0) {
        _stopRecording();
      }

      notifyListeners();
    });

    notifyListeners();
  }

  void _stopRecording() {
    _timer?.cancel();
    _timer = null;
    _isRecording = false;
    _progress = 0.0;
    notifyListeners();
  }

  void reset() {
    if (_isRecording) return;
    debugPrint("Reset tapped");
    notifyListeners();
  }

  void delete() {
    if (_isRecording) return;
    debugPrint("Delete tapped");
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
