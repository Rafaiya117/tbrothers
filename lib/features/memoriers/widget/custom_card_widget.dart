import 'package:flutter/material.dart';

class MediaCardWidget extends StatelessWidget {
  final bool isAudio;
  final bool isRecording;
  final VoidCallback onRecordPressed;

  const MediaCardWidget({
    super.key,
    required this.isAudio,
    required this.isRecording,
    required this.onRecordPressed,
  });

  static const Color darkCard = Color(0xFF1E2D4A);
  static const Color recordButtonColor = Colors.white;
  static const Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Media Card
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: darkCard,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              isAudio ? Icons.mic : Icons.videocam,
              color: iconColor,
              size: 64,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Record Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onRecordPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: recordButtonColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Record',
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
