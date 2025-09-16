import 'package:flutter/material.dart';

class EmotionalCard extends StatelessWidget {
  final String title;
  final List<String> imageUrls; // Pass 3 image paths (left, center, right)

  const EmotionalCard({
    Key? key,
    required this.title,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1.2, 
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left Image
                Positioned(
                  left: 15,
                  child: Transform.rotate(
                    angle: -0.20,
                    child: _buildImage(imageUrls[0], scale: 0.8),
                  ),
                ),
                // Right Image
                Positioned(
                  right: 15,
                  child: Transform.rotate(
                    angle: -0.10,
                    child: _buildImage(imageUrls[2], scale: 0.8),
                  ),
                ),
                // Center Image (biggest)
                _buildImage(imageUrls[1], scale: 1.0),
              ],
            ),
          ),
          //SizedBox(height: 2.h),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path, {double scale = 1.0}) {
    const baseHeight = 100.0;
    const aspectRatio = 3 / 4; // portrait ratio

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: baseHeight * scale,
        width: (baseHeight * scale) * aspectRatio,
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}
