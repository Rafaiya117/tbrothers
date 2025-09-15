import 'package:flutter/material.dart';

enum MediaType { image, video, text }

class MediaCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? description;
  final MediaType type;
  final double? height;
  final double? width;

  const MediaCard({
    Key? key,
    this.imagePath,
    this.title,
    this.description,
    required this.type,
    this.height,
    this.width,
  }) : super(key: key);

  /// Return default size based on type
  double get _defaultHeight {
    switch (type) {
      case MediaType.image:
        return 175;
      case MediaType.video:
        return 267;
      case MediaType.text:
        return 131;
    }
  }

  double get _defaultWidth => 170;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: width ?? _defaultWidth,
        height: height ?? _defaultHeight,
        color: Colors.white,
        child: type == MediaType.text
            ? _buildTextCard()
            : _buildImageOrVideoCard(),
      ),
    );
  }

  /// Image or Video Card
  Widget _buildImageOrVideoCard() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              type == MediaType.video ? Icons.videocam : Icons.photo,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  /// Text Card
  Widget _buildTextCard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Row(
              children: [
                const Icon(Icons.article,
                    size: 18, color: Colors.black54), // text icon
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (description != null) ...[
            const SizedBox(height: 6),
            Text(
              description!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
