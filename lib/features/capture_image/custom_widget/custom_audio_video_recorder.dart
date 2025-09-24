import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecordControlPanel extends StatelessWidget {
  final VoidCallback onRecord;
  final VoidCallback onReset;
  final VoidCallback onDelete;
  final bool isRecording;
  final double progress;

  const RecordControlPanel({
    Key? key,
    required this.onRecord,
    required this.onReset,
    required this.onDelete,
    this.isRecording = false,
    this.progress = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Reset button
          IconButton(
            icon: const Icon(Icons.refresh),
            color: Colors.white70,
            iconSize: 28,
            onPressed: isRecording ? null : onReset,
          ),

          // Record button with circular progress
          GestureDetector(
            onTap: onRecord,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular progress indicator
                  if (isRecording)
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 4,
                        valueColor:
                            const AlwaysStoppedAnimation(Colors.orange),
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
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isRecording ? Colors.red : Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Delete button
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: Colors.white70,
            iconSize: 28,
            onPressed: isRecording ? null : onDelete,
          ),
        ],
      ),
    );
  }
}
