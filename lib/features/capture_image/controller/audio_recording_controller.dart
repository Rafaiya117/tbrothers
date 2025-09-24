import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:camera/camera.dart';

class RecordingController extends ChangeNotifier {
  bool _isRecording = false;
  double _progress = 0.0;
  static const Duration maxDuration = Duration(seconds: 15);
  Timer? _timer;

  // Controllers
  final RecorderController recorderController = RecorderController();
  CameraController? cameraController;

  bool get isRecording => _isRecording;
  double get progress => _progress;

  // Initialize camera for video preview
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    await cameraController!.initialize();
    notifyListeners();
  }

  void record({String mediaType = "audio"}) {
    if (_isRecording) {
      _stopRecording(mediaType: mediaType);
    } else {
      _startRecording(mediaType: mediaType);
    }
  }

  void _startRecording({required String mediaType}) {
    _isRecording = true;
    _progress = 0.0;

    // Start recording depending on media type
    if (mediaType == "audio") {
      recorderController.record();
    } else if (mediaType == "video") {
      cameraController?.startVideoRecording();
    }

    const tick = Duration(milliseconds: 100);
    int totalTicks = maxDuration.inMilliseconds ~/ tick.inMilliseconds;
    int currentTick = 0;

    _timer = Timer.periodic(tick, (timer) {
      currentTick++;
      _progress = currentTick / totalTicks;

      if (_progress >= 1.0) {
        _stopRecording(mediaType: mediaType);
      }

      notifyListeners();
    });

    notifyListeners();
  }

  void _stopRecording({required String mediaType}) {
    _timer?.cancel();
    _timer = null;
    _isRecording = false;
    _progress = 0.0;

    if (mediaType == "audio") {
      recorderController.stop();
    } else if (mediaType == "video") {
      cameraController?.stopVideoRecording();
    }

    notifyListeners();
  }

  void reset() {
    if (_isRecording) return;
    _progress = 0.0;
    notifyListeners();
  }

  void delete() {
    if (_isRecording) return;
    _progress = 0.0;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    recorderController.dispose();
    cameraController?.dispose();
    super.dispose();
  }
}
