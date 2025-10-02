import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum GridItemType {
  video,
  audio,
}


class GridItem {
  final GridItemType type;
  final String? assetPath;
  final List<double>? waveformHeights; 

  GridItem.video({required this.assetPath})
      : type = GridItemType.video,
        waveformHeights = null;

  GridItem.audio({required this.waveformHeights})
      : type = GridItemType.audio,
        assetPath = null;
}

class StaticAudioWaveformPainter extends CustomPainter {
  final List<double> waveformHeights;
  final Color waveColor;

  StaticAudioWaveformPainter({
    required this.waveformHeights,
    this.waveColor = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double barWidth = 2.0;
    const double gap = 1.0;
    const double totalBarAndGapWidth = barWidth + gap;
    final int numBarsToDraw = (size.width / totalBarAndGapWidth).floor();

    final Paint wavePaint = Paint()
      ..color = waveColor
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < numBarsToDraw; i++) {
      int dataIndex = i;
      if (dataIndex >= waveformHeights.length) break;

      final double normalizedHeight = waveformHeights[dataIndex];
      final double barHeight = size.height * 0.6 * normalizedHeight; 
      final double x = i * totalBarAndGapWidth + gap;
      final double startY = (size.height - barHeight) / 2; 
      final double endY = (size.height + barHeight) / 2;

      canvas.drawLine(Offset(x, startY), Offset(x, endY), wavePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false; 
}


class ArchiveInterviewScreen extends StatelessWidget {
  const ArchiveInterviewScreen({super.key});
  List<double> _generateStaticWaveform() {
    return List.generate(50, 
      (index) => Random().nextDouble() * 0.8 + 0.2, 
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<GridItem> _gridItems = [
      GridItem.video(assetPath: 'assets/grid_video_1.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_2.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_3.jpg'),

      GridItem.video(assetPath: 'assets/grid_video_4.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_5.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_6.jpg'),

      GridItem.video(assetPath: 'assets/grid_video_7.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_8.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_9.jpg'), 

      GridItem.audio(waveformHeights: _generateStaticWaveform()),
      GridItem.audio(waveformHeights: _generateStaticWaveform()),
      GridItem.video(assetPath: 'assets/grid_video_10.jpg'),

      GridItem.video(assetPath: 'assets/grid_video_11.jpg'),
      GridItem.video(assetPath: 'assets/grid_video_12.jpg'),
      GridItem.audio(waveformHeights: _generateStaticWaveform()),
    ];

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
          'Archive Interview',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/gallery_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {}, 
          ),
          IconButton(
            icon: SvgPicture.asset('assets/more_options_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {}, 
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0, 
          ),
          itemCount: _gridItems.length,
          itemBuilder: (context, index) {
            final item = _gridItems[index];
            return _buildGridItem(item);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(GridItem item) {
    return GestureDetector(
      onTap: () {
        print('Tapped on ${item.type == GridItemType.video ? "Video" : "Audio"} item.');
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.type == GridItemType.audio ? const Color(0xFFE3F2FD) : Colors.black, // Light blue for audio, black for video placeholder
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (item.type == GridItemType.video && item.assetPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.assetPath!,
                  fit: BoxFit.cover,
                ),
              ),
            if (item.type == GridItemType.audio && item.waveformHeights != null)
              Center( 
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomPaint(
                    size: const Size(double.infinity, 50), 
                    painter: StaticAudioWaveformPainter(
                      waveformHeights: item.waveformHeights!,
                      waveColor: Colors.blue.shade600, 
                    ),
                  ),
                ),
              ),

            Center(
              child: item.type == GridItemType.video
            ? SvgPicture.asset(
                'assets/play_button_red.svg', 
                width: 40,
                height: 40,
              )
              : SvgPicture.asset(
                'assets/microphone_icon.svg',
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), 
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}