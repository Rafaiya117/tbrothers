import 'dart:ui';
import 'package:flutter/cupertino.dart';

class FontColors{
  static const primary_color = Color(0xFF2F4A58);
  static const secondary_color = Color(0xFF63636A);
  static const  text_colors = Color(0xFFFFFFFF);
  static const disable_text = Color(0xFF999999);
  static const disabled_buttonColor = Color(0xFFE6E6E6);
  static const button_color = Color(0xFFFE8641);
  static const background_color = Color(0xFF002D4F);
}
class AppGradientColors{
  static const background_color = LinearGradient(
    colors: [
      Color(0xFF017FDC),
      Color(0xFF030728),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const linear_button = LinearGradient(
    colors: [
      Color(0xFFFEB253),
      Color(0xFFFF8B43),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}