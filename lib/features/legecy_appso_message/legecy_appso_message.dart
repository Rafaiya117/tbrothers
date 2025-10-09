import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/legecy_appso_message/controller/appso_msg_controller.dart';
import 'package:appsoleum/features/legecy_appso_message/model/appso_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import 'package:provider/provider.dart'; 


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
      final double barHeight = size.height * 0.2 * normalizedHeight; 
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

  Widget _buildFilterButton(BuildContext context, String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Provider.of<MessageController>(context, listen: false).setFilter(text);
      },
      child: Container(
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
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  List<double> _generateStaticWaveform() {
    return List.generate(100, (index) => Random().nextDouble() * 0.8 + 0.2);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessageController(),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradientColors.background_color
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: FontColors.icon_color,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {
                context.pop();
              },
            ),
            title: const Text(
              'Appso Message',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Consumer<MessageController>(
            builder: (context, controller, _) {
              List<AppsoMessage> messages = controller.messages;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildFilterButton(context, 'All', controller.selectedFilter == 'All'),
                          _buildFilterButton(context, 'Incoming', controller.selectedFilter == 'Incoming'),
                          _buildFilterButton(context, 'Outgoing', controller.selectedFilter == 'Outgoing'),
                          _buildFilterButton(context, 'Delivered', controller.selectedFilter == 'Delivered'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      separatorBuilder: (_, __) => const SizedBox(height: 15),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        return _buildMessageCard(
                          context: context,
                          isAudio: msg.isAudio,
                          profilePicAsset: msg.profilePicAsset,
                          name: msg.name,
                          statusTag: msg.statusTag,
                          statusTagColor: msg.statusTagColor,
                          messageText: msg.messageText,
                          deliveryDate: msg.deliveryDate,
                          videoThumbnailAsset: msg.videoThumbnailAsset,
                          waveformHeights: msg.waveformHeights,
                          playbackProgress: msg.playbackProgress,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMessageTag(String tag, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
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
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (!isAudio && videoThumbnailAsset != null)
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white, Colors.transparent],
                        stops: [0.0, 0.7, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      videoThumbnailAsset,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            if (isAudio)
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  child: CustomPaint(
                    painter: AudioWaveformPainter(
                      waveformHeights:waveformHeights ?? [],
                      playbackProgress:playbackProgress,
                    ),
                    size: const Size(double.infinity, double.infinity),
                  ),
                ),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.7,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 0.5, 1.0],
                      colors: [Color(0xFF1B2258), Color(0xFF24306B), Colors.transparent],
                    ),
                  ),
                ),
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
              bottom: 15,
              right: 15,
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
              top: -2,
              right: -6,
              child: _buildMessageTag(statusTag, statusTagColor),
            ),
            Positioned(
              left: 15,
              bottom: 15,
              right: 15,
              child: Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            profilePicAsset,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
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
                              child: SvgPicture.asset(
                                'assets/delivered_icon.svg',
                                height: 12,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        if (isAudio || (!isAudio && videoThumbnailAsset != null))
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                isAudio ? 'assets/icons/micro_phone.svg' : 'assets/icons/camera.svg',
                                width: 5,
                                height: 5,
                                colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
                              ),
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
                              child: SvgPicture.asset(
                                'assets/incoming_icon.svg',
                                height: 12,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            messageText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/calendar_icon.svg',
                                colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                                height: 14,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  deliveryDate,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
