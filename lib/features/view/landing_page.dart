import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: FontColors.background_color,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 2),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 360.h,
              left: 30.w,
              right: 30.w,
              child:Image.asset(
                'assets/images/logo.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}