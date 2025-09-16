import 'package:flutter/material.dart';

enum MediaType { audio, video, image, text }

class MediaCards extends StatelessWidget {
  final MediaType type;
  final String title;
  final String subtitle;
  final String? mediaPath;
  final String? duration;
  final String scheduledDate;
  final VoidCallback onTap;

  const MediaCards({
    Key? key,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.scheduledDate,
    this.mediaPath,
    this.duration,
    required this.onTap,
  }) : super(key: key);

  String get badgeText {
    switch (type) {
      case MediaType.audio:
        return "Audio";
      case MediaType.video:
        return "Video";
      case MediaType.image:
        return "Photos";
      case MediaType.text:
        return "Text";
    }
  }

  IconData get badgeIcon {
    switch (type) {
      case MediaType.audio:
        return Icons.graphic_eq_rounded;
      case MediaType.video:
        return Icons.videocam_rounded;
      case MediaType.image:
        return Icons.image_rounded;
      case MediaType.text:
        return Icons.article_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔵 Rectangular Banner
        Container(
          //margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF007BFF),
            borderRadius: BorderRadius.circular(16), // Rectangular with rounded corners
          ),
          alignment: Alignment.center,
          child: Text(
            'Scheduled on: $scheduledDate',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // 🟦 Card overlapping banner
        Transform.translate(
          offset: const Offset(0, -12), // Overlap effect
          child: Container(
            //margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1C3F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📷 Media Preview
                if (type != MediaType.text)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: mediaPath != null
                              ? Image.asset(
                                  mediaPath!,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 150,
                                  width: double.infinity,
                                  color: Colors.grey.shade300,
                                  child: const Icon(Icons.image, size: 50),
                                ),
                        ),

                        // 🏷️ Badge
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(badgeIcon, size: 14, color: Colors.white),
                                const SizedBox(width: 4),
                                Text(
                                  badgeText,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // ⏱️ Duration (for audio/video)
                        if ((type == MediaType.audio || type == MediaType.video) && duration != null)
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Container(
                              //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.play_arrow, color: Colors.deepOrange, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    duration!,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                // 📝 Text Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
