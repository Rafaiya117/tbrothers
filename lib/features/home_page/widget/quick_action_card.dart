import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final Widget icon;                
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final TextStyle? labelStyle;
  final double width;
  final double height;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.backgroundColor = const Color(0xFF2F2F53),
    this.iconBackgroundColor = const Color(0xFFF2E7E2),
    this.labelStyle,
    this.width = 111.33,
    this.height = 116,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: icon),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: labelStyle ??
                const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
