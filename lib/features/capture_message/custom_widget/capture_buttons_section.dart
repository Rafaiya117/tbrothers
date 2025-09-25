import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraControlBar extends StatelessWidget {
  final VoidCallback? onGalleryTap;
  final VoidCallback? onCaptureTap;
  final VoidCallback? onFlashTap;

  const CameraControlBar({
    Key? key,
    this.onGalleryTap,
    this.onCaptureTap,
    this.onFlashTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Gallery icon
        IconButton(
          onPressed: onGalleryTap,
          icon: SvgPicture.asset(
            'assets/icons/gallary_icon.svg',
            width: 16.67.w,
            height: 15.h,
          ),
        ),
        GestureDetector(
          onTap: onCaptureTap,
          child: Container(
            width: 45.w,
            height: 58.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: FontColors.background_color,
              border: Border.all(color: Color(0xFFFFD9C4))
              // gradient: LinearGradient(
              //   colors: [Color(0xFFFFB76B), Color(0xFFFF7B43)],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
            ),
            child: Center(
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  //color: Color(0xFFFF7B43),
                  gradient: AppGradientColors.linear_button,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),

        // Flash off icon
        IconButton(
          onPressed: onFlashTap,
          icon: SvgPicture.asset(
            'assets/icons/flash_icon.svg',
            width: 16.67.w,
            height: 15.h,
          ),
        ),
      ],
    );
  }
}
// CameraControlBar(
//   onGalleryTap: () => print('Gallery tapped'),
//   onCaptureTap: () => print('Capture tapped'),
//   onFlashTap: () => print('Flash toggled'),
// ),
