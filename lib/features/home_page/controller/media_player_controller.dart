import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:video_thumbnail/video_thumbnail.dart';

class MediaController extends ChangeNotifier {
  String mediaUrl;

  String mediaType = "unknown";
  Uint8List? videoThumbnail;

  VideoPlayerController? _videoController;
  PlayerController? _audioWaveController; 

  bool isPlaying = false;
  final ImagePicker _picker = ImagePicker();
  
  MediaController({this.mediaUrl = ''}) {
    if (mediaUrl.isNotEmpty) {
      _loadMedia(mediaUrl);
    }
  }

  VideoPlayerController? get videoController => _videoController;
  PlayerController? get audioWaveController => _audioWaveController; 

  Future<void> pickMedia() async {
    final XFile? file = await _picker.pickMedia(); 

    if (file != null) {
      mediaUrl = file.path; 
      await _loadMedia(mediaUrl);
    } else {
      print('Media picking canceled.');
    }
  }

  Future<void> _loadMedia(String url) async {
    await _disposeMedia();
    final ext = path.extension(url).toLowerCase();

    if ([".jpg", ".jpeg", ".png", ".gif", ".webp"].contains(ext)) {
      mediaType = "image";
    } else if ([".mp4", ".mov", ".avi", ".mkv"].contains(ext)) {
      mediaType = "video";
      await _prepareVideo(url);
    } else if ([".mp3", ".wav", ".aac", ".ogg"].contains(ext)) {
      mediaType = "audio";
      await _prepareAudio(url);
    } else {
      mediaType = "unknown";
    }

    notifyListeners();
  }

  Future<void> _prepareVideo(String url) async {
    final thumb = await VideoThumbnail.thumbnailData(
      video: url,
      imageFormat: ImageFormat.PNG,
      maxWidth: 400,
      quality: 75,
    );
    videoThumbnail = thumb;
    // ignore: deprecated_member_use
    _videoController = VideoPlayerController.network(url); 
    await _videoController!.initialize();
  }

  Future<void> _prepareAudio(String url) async {
    _audioWaveController = PlayerController();
    await _audioWaveController!.preparePlayer(path: url); 
  }

  void togglePlay() {
    if (mediaType == "video" && _videoController != null) {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
        isPlaying = false;
      } else {
        _videoController!.play();
        isPlaying = true;
      }
    } else if (mediaType == "audio" && _audioWaveController != null) {
      if (isPlaying) {
        _audioWaveController!.pausePlayer();
        isPlaying = false;
      } else {
        _audioWaveController!.startPlayer();
        isPlaying = true;
      }
    }
    notifyListeners();
  }

  Future<void> _disposeMedia() async {
    await _videoController?.dispose();
    _audioWaveController?.dispose(); 
    videoThumbnail = null;
    isPlaying = false;
    _videoController = null;
    _audioWaveController = null;
  }

  @override
  void dispose() {
    _disposeMedia();
    super.dispose();
  }
}