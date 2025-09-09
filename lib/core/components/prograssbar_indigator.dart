import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final double barHeight;
  final LinearGradient? progressGradient;
  final Color backgroundColor;

  const ProgressIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.barHeight = 20.0,
    this.progressGradient,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentPage / totalPages;

    return SizedBox(
      width: 172,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            //!---------blurred background----------!
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: barHeight,
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.1),
              ),
            ),

            //!----------Progress with gradient---------!
            LinearPercentIndicator(
              lineHeight: barHeight,
              percent: progress,
              backgroundColor: Colors.transparent,
              barRadius: const Radius.circular(8),
              padding: EdgeInsets.zero,
              linearGradient: progressGradient,
            ),
          ],
        ),
      ),
    );
  }
}
