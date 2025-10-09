// controllers/message_controller.dart
import 'dart:math';
import 'package:appsoleum/features/legecy_appso_message/model/appso_model.dart';
import 'package:flutter/material.dart';


class MessageController extends ChangeNotifier {
  final List<AppsoMessage> _allMessages = [];

  String _selectedFilter = 'All';
  String get selectedFilter => _selectedFilter;

  MessageController() {
    _initializeMessages();
  }

  List<AppsoMessage> get messages => _filterMessages();

  /// Generate waveform heights for an audio message
  List<double> generateWaveform({int length = 100, double min = 0.2, double max = 1.0}) {
    final random = Random();
    return List.generate(length, (_) => random.nextDouble() * (max - min) + min);
  }

  void _initializeMessages() {
    _allMessages.addAll([
      AppsoMessage(
        isAudio: false,
        profilePicAsset: 'assets/images/profile_img1.png',
        name: 'Noah Reed',
        statusTag: 'Incoming',
        statusTagColor: Colors.green.shade600,
        messageText: '"Saving all my love for you"',
        deliveryDate: 'Delivered Aug 13, 2028',
        videoThumbnailAsset: 'assets/images/appso_msg.png',
      ),
      AppsoMessage(
        isAudio: true,
        profilePicAsset: 'assets/images/profile_img2.png',
        name: 'Ryan Hayes',
        statusTag: 'Delivered',
        statusTagColor: Colors.green.shade600,
        messageText: '"Saving all my love for you"',
        deliveryDate: 'Delivered February 22, 2040',
        waveformHeights: generateWaveform(),
        playbackProgress: 0.3,
      ),
      AppsoMessage(
        isAudio: false,
        profilePicAsset: 'assets/images/profile_img3.png',
        name: 'Ava Bennet',
        statusTag: 'Incoming',
        statusTagColor: Colors.green.shade600,
        messageText: '"Saving all my love for you"',
        deliveryDate: 'Delivered December 16, 2049',
        videoThumbnailAsset: 'assets/images/appso_msg1.png',
      ),
      AppsoMessage(
        isAudio: true,
        profilePicAsset: 'assets/images/profile_img4.png',
        name: 'Jake Pearson',
        statusTag: 'Outgoing',
        statusTagColor: Colors.orange.shade700,
        messageText: '"Saving all my love for you"',
        deliveryDate: 'Delivered May 29, 2032',
        waveformHeights: generateWaveform(),
        playbackProgress: 0.7,
      ),
    ]);
  }

  void setFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<AppsoMessage> _filterMessages() {
    if (_selectedFilter == 'All') return _allMessages;
    return _allMessages.where((msg) => msg.statusTag == _selectedFilter).toList();
  }
}
