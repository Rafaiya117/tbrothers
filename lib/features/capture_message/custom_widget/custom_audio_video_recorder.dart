import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // REQUIRED for SvgPicture

class RecordControlPanel extends StatelessWidget {
  final VoidCallback onRecord;
  final VoidCallback onReset;
  final VoidCallback onDelete;
  final bool isRecording;
  final double progress;

  // NEW PROPERTIES for Video Playback
  final bool hasRecording;
  final bool isPlayerPlaying;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  const RecordControlPanel({
    super.key,
    required this.onRecord,
    required this.onReset,
    required this.onDelete,
    this.isRecording = false,
    this.progress = 0.0,
    // Initialize new properties
    this.hasRecording = false,
    required this.isPlayerPlaying,
    required this.onPlay,
    required this.onPause,
  });

  // Helper widget to build the central button
  Widget _buildCenterButton() {
    // If a video is recorded, display Play/Pause button
    if (hasRecording && !isRecording) {
      final iconPath = isPlayerPlaying
          ? 'assets/icons/pause_button.svg' 
          : 'assets/icons/play_button.svg'; 
      
      final action = isPlayerPlaying ? onPause : onPlay;
      
      return GestureDetector(
        onTap: action,
        child: SizedBox(
          width: 70,
          height: 70,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 60, // Sizing the SVG for visibility
              height: 60,
              //colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), // Color the icon white
            ),
          ),
        ),
      );
    } 
    
    // Otherwise, display the Record/Stop Record button
    else {
      return GestureDetector(
        onTap: onRecord,
        child: SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Circular progress indicator (only visible when recording)
              if (isRecording)
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4,
                    valueColor: const AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.white24,
                  ),
                ),

              // Outer circle
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3A3A59),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: isRecording ? 30 : 40, // Square shape for stop, circle for start
                  height: isRecording ? 30 : 40,
                  decoration: BoxDecoration(
                    shape: isRecording ? BoxShape.rectangle : BoxShape.circle,
                    borderRadius: isRecording ? BorderRadius.circular(4) : null,
                    color: isRecording ? Colors.red : Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Reset button (Disabled during recording)
          IconButton(
            icon: const Icon(Icons.refresh),
            color: hasRecording || isRecording ? Colors.white70 : Colors.white24,
            iconSize: 28,
            onPressed: isRecording ? null : onReset,
          ),

          // Central Record/Play/Pause button
          _buildCenterButton(),
          
          // Delete button (Disabled during recording)
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: hasRecording || isRecording ? Colors.white70 : Colors.white24,
            iconSize: 28,
            onPressed: isRecording ? null : onDelete,
          ),
        ],
      ),
    );
  }
}