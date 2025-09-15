import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableTextButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final Gradient? selectedGradient;
  final double borderRadius;
  final Color borderColor;

  const SelectableTextButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.fontSize = 14,
    required this.textColor,
    required this.backgroundColor,
    this.selectedGradient,
    this.borderRadius = 20,
    this.borderColor = Colors.transparent, // default to no border
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoration = isSelected
    ? BoxDecoration(
        gradient: selectedGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1.5), 
      )
    : BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1.5),
      );
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: decoration,
          child: 
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor:Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                  color: isSelected ? Colors.transparent : borderColor,
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal:16, vertical: 8),
            ),
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
