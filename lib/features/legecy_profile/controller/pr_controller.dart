import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends ChangeNotifier {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isRecording = false;
  bool _isPlaying = false;
  String? _audioPath;

  bool get isRecording => _isRecording;
  bool get isPlaying => _isPlaying;
  String? get audioPath => _audioPath;

  // Dummy comments (already there)
  final List<Map<String, dynamic>> _comments = [
    {
      'avatar': 'assets/richard_profile.jpg',
      'name': 'Richard Robert',
      'text': 'Tap to play audio comment',
      'isAudio': true,
      'timestamp': 'Today 12:40 PM',
      'audioPath': null, // optional local path if available
    },
    {
      'avatar': 'assets/michaela_profile.jpg',
      'name': 'Michaela Robbins',
      'text':
          'Congratulations to my handsome little nephew! Auntie really enjoyed watching you sing and dance!',
      'isAudio': false,
      'timestamp': 'Yesterday 2:15 PM',
      'audioPath': null,
    },
  ];

  List<Map<String, dynamic>> get comments => _comments;

  // 🎙️ Start/stop recording
 Future<void> toggleRecording() async {
  final dir = await getApplicationDocumentsDirectory();
  final filePath =
      '${dir.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

  if (_isRecording) {
    final path = await _audioRecorder.stop(); 
    _isRecording = false;
    _audioPath = path;
    notifyListeners();
    debugPrint('✅ Recording saved: $_audioPath');
  } else {
    await _audioRecorder.start(
  const RecordConfig(
    encoder: AudioEncoder.aacLc,
    bitRate: 128000,
    sampleRate: 44100,
  ),
  path: filePath,
);

    _isRecording = true;
    notifyListeners();
    debugPrint('🎙️ Recording started...');
  }
}

  // ▶️ Play / ⏸ Pause audio
  Future<void> togglePlayPause() async {
    if (_audioPath == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
      _isPlaying = false;
    } else {
      await _audioPlayer.setFilePath(_audioPath!);
      await _audioPlayer.play();
      _isPlaying = true;

      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          _isPlaying = false;
          notifyListeners();
        }
      });
    }
    notifyListeners();
  }

  // ⏹ Stop playback
  Future<void> stopPlayback() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }

  // 📤 Send the audio comment
  void sendAudioComment() {
    if (_audioPath == null) return;
    _comments.insert(0, {
      'avatar': 'assets/richard_profile.jpg',
      'name': 'Richard Robert',
      'isAudio': true,
      'timestamp': 'Now',
      'audioPath': _audioPath,
      'text': 'Voice message',
    });
    _audioPath = null;
    notifyListeners();
  }
}
