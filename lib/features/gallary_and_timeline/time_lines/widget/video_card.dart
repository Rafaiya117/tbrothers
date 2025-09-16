import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


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
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/video_player_icon.svg',
                width: 48,
                height: 48,
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
