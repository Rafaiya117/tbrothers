import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String thumbnailPath;
  final String duration;
  final VoidCallback onTap;

  const VideoCard({
    Key? key,
    required this.thumbnailPath,
    required this.duration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              thumbnailPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white.withOpacity(0.9),
                size: 48,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                duration,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
