import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class MediaPreviewCard extends StatelessWidget {
  final String category;
  final String title;
  final String location;
  final String mediaUrl;
  final String duration;
  final String mediaType;
  final Uint8List? videoThumbnail;
  final bool isPlaying;
  final VoidCallback onPlayPressed;

  const MediaPreviewCard({
    super.key,
    required this.category,
    required this.title,
    required this.location,
    required this.mediaUrl,
    required this.duration,
    required this.mediaType,
    this.videoThumbnail,
    required this.isPlaying,
    required this.onPlayPressed, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget thumbnail;
    if (mediaType == "image") {
      thumbnail = Image.network(
        mediaUrl,
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 180,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, size: 40),
        ),
      );
    } else if (mediaType == "video") {
      thumbnail = videoThumbnail != null
        ? Image.memory(
          videoThumbnail!,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        )
        : Container(
          height: 180,
          color: Colors.black26,
          child: const Center(child: CircularProgressIndicator()),
        );
      } else if (mediaType == "audio") {
      thumbnail = Container(
        height: 180,
        color: Colors.blue[50],
        child: Center(
          child: AudioFileWaveforms(
            size: Size(MediaQuery.of(context).size.width * 0.7, 70),
            playerController: PlayerController()..preparePlayer(path: mediaUrl),
            enableSeekGesture: true,
            waveformType: WaveformType.fitWidth,
            continuousWaveform: true,
            playerWaveStyle: const PlayerWaveStyle(
              fixedWaveColor: Colors.grey,
              liveWaveColor: Colors.blueAccent,
              spacing: 5,
            ),
          ),
        ),
      );
    } else {
      thumbnail = Container(
        height: 180,
        color: Colors.grey,
        child: const Center(child: Text("Unsupported format")),
      );
    }
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: thumbnail,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (mediaType != "image")
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Play button
                      InkWell(
                        onTap: onPlayPressed,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            //color: Colors.white70,
                            shape: BoxShape.circle,
                          ),
                          child: mediaType == "video"
                            ? SvgPicture.asset(
                              isPlaying
                                ? "assets/icons/pause.svg"
                                : "assets/icons/video_player_icon.svg",
                                  width: 28,
                                  height: 28,
                                  // ignore: deprecated_member_use
                                  // color: Colors.wh,
                                )
                                : SvgPicture.asset(
                                  'assets/icons/video_player_icon.svg',
                                  width: 28.w,
                                  height: 28.h,
                                  // ignore: deprecated_member_use
                                  color:Colors.white.withOpacity(0.84) ,
                                ),
                              ),
                            ),
                          // Duration badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          child: Text(
                            duration,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          // Title + Location (with dark background like design)
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1F2544), // dark navy bg
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "$title\n$location",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// MediaPreviewCard(
//   category: "Music",
//   title: "Relaxing Piano Track",
//   location: "Spotify Demo",
//   mediaUrl: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3", // valid mp3
//   duration: "03:15",
//   onTap: () {
//     print("Play audio tapped!");
//   },
// ),
// MediaPreviewCard(
//   category: "Family",
//   title: "Ethan’s 2nd birthday party",
//   location: "San Jose, California",
//   mediaUrl: "https://picsum.photos/400/200", // random valid image
//   duration: "02:53",
//   onTap: () {
//     print("Play tapped!");
//   },
// ),
