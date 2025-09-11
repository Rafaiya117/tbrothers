import 'package:flutter/material.dart';

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
          icon: Icon(
            Icons.photo_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),

        // Capture button with double ring gradient border
        GestureDetector(
          onTap: onCaptureTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFFFB76B), Color(0xFFFF7B43)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFFFF7B43),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),

        // Flash off icon
        IconButton(
          onPressed: onFlashTap,
          icon: Icon(
            Icons.flash_off,
            color: Colors.white,
            size: 24,
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
