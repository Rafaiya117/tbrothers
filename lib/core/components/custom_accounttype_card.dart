import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAccountOption extends StatelessWidget {
  final String? svgIconPath;
  final IconData? icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final VoidCallback onTap;
  final bool isSelected;
  final Gradient? selectedGradient;

  const CustomAccountOption({
    super.key,
    this.svgIconPath,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor = Colors.blue,
    this.iconBackgroundColor = const Color(0xFFEAF3FF),
    this.titleColor = const Color(0xFF2F4A58),
    this.subtitleColor = Colors.black54,
    this.isSelected = false,
    this.selectedGradient,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;

    if (svgIconPath != null) {
      iconWidget = SvgPicture.asset(
        svgIconPath!,
        width: 24.w,
        height: 20.h,
        color: iconColor,
      );
    } else if (icon != null) {
      iconWidget = Icon(icon, color: iconColor, size: 22);
    } else {
      iconWidget = const SizedBox();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          // 🔹 Background: gradient if selected, else white
          gradient: isSelected ? selectedGradient : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.orange : const Color(0xFFF2F2F2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: iconWidget),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xFF63636A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
