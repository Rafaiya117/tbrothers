// models/appso_message.dart
import 'package:flutter/material.dart';

class AppsoMessage {
  final bool isAudio;
  final String profilePicAsset;
  final String name;
  final String statusTag;
  final Color statusTagColor;
  final String messageText;
  final String deliveryDate;
  final String? videoThumbnailAsset;
  final List<double>? waveformHeights;
  final double playbackProgress;

  AppsoMessage({
    required this.isAudio,
    required this.profilePicAsset,
    required this.name,
    required this.statusTag,
    required this.statusTagColor,
    required this.messageText,
    required this.deliveryDate,
    this.videoThumbnailAsset,
    this.waveformHeights,
    this.playbackProgress = 0.0,
  });
}
