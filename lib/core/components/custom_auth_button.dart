import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColorStart;  
  final Color buttonColorEnd;   
  final double height;
  final double width;
  final double borderRadius;
  final bool hasBorder;
  final Color borderColor;
  final String? icon;
  final Color iconColor;
  final double svgIconSize;
  const CustomElevatedButton({
    super.key, 
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColorStart = const Color(0xFFFF7F50), 
    this.buttonColorEnd = const Color(0xFFFF4500),   
    this.height = 48.0,
    this.width = 318.0,
    this.borderRadius = 12.0,
    this.hasBorder = false,            
    this.borderColor = Colors.black,   
    this.icon,
    this.iconColor=Colors.white,
    this.svgIconSize = 20.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // Gradient background
        gradient: LinearGradient(
          colors: [buttonColorStart, buttonColorEnd], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        // Conditional border based on hasBorder
        border: hasBorder
          ? Border.all(color: borderColor, width: 1) 
          : Border.all(color: Colors.transparent),   
        ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: Colors.transparent,        
          padding: EdgeInsets.zero,    
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                SvgPicture.asset(
                  icon!,
                  height: svgIconSize,
                  width: svgIconSize,
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}