import 'dart:ui';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_message/controller/capture_controller.dart';
import 'package:flutter/material.dart';


class MediaToggle extends StatelessWidget {
  final CaptureController controller;
  final Function(String) onSelectionChanged;

  const MediaToggle({
    Key? key,
    required this.controller,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: FontColors.background_color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
              children: controller.options.map((option) {
              final bool isSelected = controller.selectedOption == option;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.selectOption(option);
                    onSelectionChanged(option);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
