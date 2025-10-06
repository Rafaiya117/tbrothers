import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final Color? label_text_color;
  final Color? input_text_color;
  final TextEditingController controller;
  final bool isPassword;
  final double height, width, paddingTop, paddingRight, paddingBottom, paddingLeft, gap, borderRadius;
  final Color backgroundColor;

  //!-------------for stateless value setState------------!
  final ValueNotifier<bool> _obscureText;

  CustomTextField({
    required this.label,
    this.hintText,
    this.label_text_color =const Color(0xFF2F4A58),
    this.input_text_color = const Color(0xFF2F4A58),
    required this.controller,
    this.isPassword = false,
    this.height = 48.0,
    this.width = 400.0,
    this.paddingTop = 8.0,
    this.paddingRight = 8.0,
    this.paddingBottom = 14.0,
    this.paddingLeft = 16.0,
    this.gap = 10.0,
    this.borderRadius = 12.0,
    this.backgroundColor = const Color(0xFFF2F2F2), 
  }) : _obscureText = ValueNotifier<bool>(isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: gap),
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: label_text_color,
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _obscureText,
            builder: (context, obscure, _) {
              return Container(
                height: height,
                width: width,
                padding: EdgeInsets.fromLTRB(paddingLeft, paddingTop, paddingRight, paddingBottom),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: backgroundColor,
                ),
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      color: Color(0xFFFFFFFF),
                    ),
                    border: InputBorder.none,
                    suffixIcon: isPassword
                      ? IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _obscureText.value = !obscure;
                        },
                      ): null,
                    suffixIconConstraints: BoxConstraints(
                      minHeight: height,
                      minWidth: 40,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    color:input_text_color,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                  //textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
