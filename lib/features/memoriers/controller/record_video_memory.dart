import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class RecordVideoMemoryController extends ChangeNotifier {
  bool _isRecording = false;
  double _progress = 0.0;
  static const Duration maxDuration = Duration(seconds: 15);
  Timer? _timer;

  String? _lastRecordedPath;
  String? get lastRecordedPath => _lastRecordedPath;

  CameraController? cameraController;
  VideoPlayerController? videoController;

  bool get isRecording => _isRecording;
  double get progress => _progress;
  bool get hasRecording => _lastRecordedPath != null;
  bool get isPlayerReady => videoController != null && videoController!.value.isInitialized;

  // Initialize camera for preview
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: true,
    );
    await cameraController!.initialize();
    notifyListeners();
  }

  // Toggle record
  void recordVideo() {
    if (_isRecording) {
      _stopRecording();
    } else {
      _startRecording();
    }
  }

  // Start recording
  Future<void> _startRecording() async {
    _isRecording = true;
    _progress = 0.0;

    final dir = await getTemporaryDirectory();
    final path =
        "${dir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4";
    _lastRecordedPath = path;

    await cameraController?.startVideoRecording();

    // update progress
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

  // Stop recording
  Future<void> _stopRecording() async {
    _timer?.cancel();
    _timer = null;
    _isRecording = false;

    final file = await cameraController?.stopVideoRecording();
    _lastRecordedPath = file?.path;

    if (_lastRecordedPath != null) {
      videoController = VideoPlayerController.file(File(_lastRecordedPath!));
      await videoController!.initialize();
      notifyListeners();
    }
  }

  // Play recorded video
  Future<void> playVideo() async {
    if (videoController == null) return;
    await videoController!.play();
    notifyListeners();

    videoController!.addListener(() {
      if (videoController!.value.position >= videoController!.value.duration) {
        notifyListeners();
      }
    });
  }

  // Pause video
  Future<void> pauseVideo() async {
    if (videoController == null) return;
    await videoController!.pause();
    notifyListeners();
  }

  // Reset progress (without deleting video)
  void reset() {
    if (_isRecording) return;
    _progress = 0.0;
    notifyListeners();
  }

  // Delete video
  void delete() {
    if (_isRecording) return;
    _progress = 0.0;
    _lastRecordedPath = null;
    videoController?.dispose();
    videoController = null;
    notifyListeners();
  }

  // Format mm:ss
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    cameraController?.dispose();
    videoController?.dispose();
    super.dispose();
  }
}