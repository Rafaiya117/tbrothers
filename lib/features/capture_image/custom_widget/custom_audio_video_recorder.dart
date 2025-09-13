import 'package:flutter/material.dart';

class RecordControlPanel extends StatelessWidget {
  final VoidCallback onRecord;
  final VoidCallback onReset;
  final VoidCallback onDelete;

  const RecordControlPanel({
    Key? key,
    required this.onRecord,
    required this.onReset,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xFF0D0D2B),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Reset Icon Button
          IconButton(
            icon: const Icon(Icons.refresh),
            color: Colors.white70,
            iconSize: 28,
            onPressed: onReset,
          ),

          // Record Button (Circular)
          GestureDetector(
            onTap: onRecord,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3A3A59), // Outer dark circle
              ),
              alignment: Alignment.center,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange, // Inner orange dot
                ),
              ),
            ),
          ),

          // Delete Icon Button
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: Colors.white70,
            iconSize: 28,
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
