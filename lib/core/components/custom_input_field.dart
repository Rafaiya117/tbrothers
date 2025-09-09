import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final double height, width, paddingTop, paddingRight, paddingBottom, paddingLeft, gap, borderRadius;

  // Add this
  final ValueNotifier<bool> _obscureText;

  CustomTextField({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.height = 48.0,
    this.width = 400.0,
    this.paddingTop = 14.0,
    this.paddingRight = 16.0,
    this.paddingBottom = 14.0,
    this.paddingLeft = 16.0,
    this.gap = 10.0,
    this.borderRadius = 12.0,
  }) : _obscureText = ValueNotifier<bool>(isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Padding(
            padding: EdgeInsets.only(bottom: gap),
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
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
                  color: Color(0xFFF2F2F2),
                ),
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(
                              obscure ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              _obscureText.value = !obscure; // toggle
                            },
                          )
                        : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
