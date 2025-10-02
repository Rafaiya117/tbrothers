import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math'; 


class AudioWaveformPainter extends CustomPainter {
  final List<double> waveformHeights; 
  final double playbackProgress; 

  AudioWaveformPainter({
    required this.waveformHeights,
    this.playbackProgress = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double barWidth = 3.0; 
    final double gap = 2.0; 
    final double totalBarAndGapWidth = barWidth + gap;
    final int numBarsToDraw = (size.width / totalBarAndGapWidth).floor();

    final Paint unplayedWavePaint = Paint()
      ..color = Colors.blue.shade600 
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round;

    final Paint playedWavePaint = Paint()
      ..color = Colors.blue.shade900 
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < numBarsToDraw; i++) {
      int dataIndex = i;
      if (dataIndex >= waveformHeights.length) break;

      final double normalizedHeight = waveformHeights[dataIndex];
      final double barHeight = size.height * 0.8 * normalizedHeight; 
      final double x = i * totalBarAndGapWidth + gap; 
      final double startY = (size.height - barHeight) / 2;
      final double endY = (size.height + barHeight) / 2;

      Paint currentPaint;
      final double barProgress = (x / size.width);
      if (barProgress < playbackProgress) {
        currentPaint = playedWavePaint;
      } else {
        currentPaint = unplayedWavePaint;
      }
      canvas.drawLine(Offset(x, startY), Offset(x, endY), currentPaint);
    }

    if (playbackProgress > 0) {
      final double playheadX = size.width * playbackProgress;
      final Paint playheadPaint = Paint()
        ..color = Colors.white 
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.butt;
      canvas.drawLine(Offset(playheadX, 0), Offset(playheadX, size.height), playheadPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is AudioWaveformPainter) {
      return oldDelegate.waveformHeights != waveformHeights ||
             oldDelegate.playbackProgress != playbackProgress;
    }
    return true;
  }
}

class AppsoMessageScreen extends StatelessWidget {
  const AppsoMessageScreen({Key? key}) : super(key: key);
  Widget _buildFilterButton(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade700 : const Color(0xFF1976D2), 
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
          ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ]: null,
        ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildMessageTag(String tag, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<double> _generateStaticWaveform() {
    return List.generate(
      100, 
      (index) => Random().nextDouble() * 0.8 + 0.2, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, 
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_arrow.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () {},
        ),
        title: const Text(
          'Appso Message',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('All', isSelected: true),
                  _buildFilterButton('Incoming'),
                  _buildFilterButton('Outgoing'),
                  _buildFilterButton('Delivered'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              children: [
                _buildMessageCard(
                  context: context,
                  isAudio: false,
                  profilePicAsset: 'assets/profile_pic_noah.jpg',
                  name: 'Noah Reed',
                  statusTag: 'Incoming',
                  statusTagColor: Colors.green.shade600, 
                  messageText: '"Saving all my love for you"',
                  deliveryDate: 'Delivered Aug 13, 2028',
                  videoThumbnailAsset: 'assets/video_thumbnail_noah.jpg',
                  playbackProgress: 0.0, 
                ),
                const SizedBox(height: 15),
                _buildMessageCard(
                  context: context,
                  isAudio: true,
                  profilePicAsset: 'assets/profile_pic_ryan.jpg',
                  name: 'Ryan Hayes',
                  statusTag: 'Delivered',
                  statusTagColor: Colors.green.shade600, 
                  messageText: '"Saving all my love for you"',
                  deliveryDate: 'Delivered February 22, 2040',
                  waveformHeights: _generateStaticWaveform(),
                  playbackProgress: 0.3, 
                ),
                const SizedBox(height: 15),
                _buildMessageCard(
                  context: context,
                  isAudio: false,
                  profilePicAsset: 'assets/profile_pic_ava.jpg',
                  name: 'Ava Bennet',
                  statusTag: 'Incoming',
                  statusTagColor: Colors.green.shade600, 
                  messageText: '"Saving all my love for you"',
                  deliveryDate: 'Delivered December 16, 2049',
                  videoThumbnailAsset: 'assets/video_thumbnail_ava.jpg',
                  playbackProgress: 0.0,
                ),
                const SizedBox(height: 15),
                _buildMessageCard(
                  context: context,
                  isAudio: true,
                  profilePicAsset: 'assets/profile_pic_jake.jpg',
                  name: 'Jake Pearson',
                  statusTag: 'Outgoing',
                  statusTagColor: Colors.orange.shade700, 
                  messageText: '"Saving all my love for you"',
                  deliveryDate: 'Delivered May 29, 2032',
                  waveformHeights: _generateStaticWaveform(),
                  playbackProgress: 0.7,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard({
    required BuildContext context,
    required bool isAudio,
    required String profilePicAsset,
    required String name,
    required String statusTag,
    required Color statusTagColor,
    required String messageText,
    required String deliveryDate,
    String? videoThumbnailAsset, 
    List<double>? waveformHeights, 
    double playbackProgress = 0.0,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1976D2), 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: isAudio ? const Color(0xFFC5D9F2) : Colors.black,  
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (!isAudio && videoThumbnailAsset != null) 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      videoThumbnailAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (isAudio && waveformHeights != null) 
                  CustomPaint(
                    painter: AudioWaveformPainter(
                      waveformHeights: waveformHeights,
                      playbackProgress: playbackProgress,
                    ),
                  ),
                Center(
                  child: SvgPicture.asset(
                    'assets/play_icon.svg',
                    colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                    width: 50,
                    height: 50,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '02:53', 
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _buildMessageTag(statusTag, statusTagColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(profilePicAsset),
                  ),
                  if (statusTag == 'Delivered' && name == 'Ryan Hayes')
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/delivered_icon.svg', height: 12, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                      ),
                    ),
                  if (statusTag == 'Incoming' && name == 'Ava Bennet')
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/incoming_icon.svg', height: 12, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      messageText,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SvgPicture.asset('assets/calendar_icon.svg', colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn), height: 14),
                        const SizedBox(width: 5),
                        Text(
                          deliveryDate,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

