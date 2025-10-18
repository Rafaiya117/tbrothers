import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class RecordAudioMemoryController extends ChangeNotifier {
  bool _isRecording = false;
  double _progress = 0.0;
  static const Duration maxDuration = Duration(seconds: 15);
  Timer? _timer;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  bool get hasRecording => _lastRecordedPath != null;

  String? _lastRecordedPath; 
  String? get lastRecordedPath => _lastRecordedPath;

  bool _isPlayerReady = false;
  bool get isPlayerReady => _isPlayerReady;


  final AudioPlayer _player = AudioPlayer();
  // RecorderController properly initialized
  final RecorderController recorderController = RecorderController()
    ..androidEncoder = AndroidEncoder.aac
    ..androidOutputFormat = AndroidOutputFormat.mpeg4
    ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
    ..sampleRate = 44100;

  final PlayerController playerController = PlayerController();
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

  void _startRecording({required String mediaType}) async {
    _isRecording = true;
    _progress = 0.0;

    // Start recording depending on media type
    if (mediaType == "audio") {
      final dir = await getTemporaryDirectory();
      final path = "${dir.path}/test_${DateTime.now().millisecondsSinceEpoch}.m4a";
       _lastRecordedPath = path;
      print("Recording to: $path");
      await recorderController.record(path: path);
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

  void _stopRecording({required String mediaType}) async {
  _timer?.cancel();
  _timer = null;
  _isRecording = false;
  _progress = 0.0;

  if (mediaType == "audio") {
    await recorderController.stop();
  } else if (mediaType == "video") {
    await cameraController?.stopVideoRecording();
  }

  if (_lastRecordedPath != null) {
    try {
      await playerController.preparePlayer(
        path: _lastRecordedPath!,
        shouldExtractWaveform: true,
      );
      _isPlayerReady = true; 
    } catch (e) {
      _isPlayerReady = false;
      debugPrint("Error preparing player: $e");
    }
  }

  notifyListeners();
}


  String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}


  void reset() {
    if (_isRecording) return;
    _progress = 0.0;
    notifyListeners();
  }

  void delete() {
  if (_isRecording) return;
  _progress = 0.0;
  _lastRecordedPath = null;
  _isPlayerReady = false; 
  notifyListeners();
}


  Future<void> play() async {
    if (_lastRecordedPath == null) return;
    await _player.setFilePath(_lastRecordedPath!);
    _isPlaying = true;
    _player.play();
    notifyListeners();

    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _isPlaying = false;
        notifyListeners();
      }
    });
  }

Future<void> pause() async {
  _isPlaying = false;
  await recorderController.pause();
  notifyListeners();
}

void clear() {
  _isRecording = false;
  _isPlaying = false;
  _progress = 0.0;
  _lastRecordedPath = null;
  _isPlayerReady = false;

  // stop controllers safely
  try {
    recorderController.stop();
  } catch (_) {}
  try {
    playerController.stopPlayer();
  } catch (_) {}

  notifyListeners();
}


  @override
  void dispose() {
    _timer?.cancel();
    recorderController.dispose();
    cameraController?.dispose();
    clear();
    super.dispose();
  }
}