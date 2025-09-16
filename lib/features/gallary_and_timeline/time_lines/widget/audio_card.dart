import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioCard extends StatelessWidget {
  final String title;
  final VoidCallback onPlay;
  final bool isPlaying; 

  const AudioCard({
    Key? key,
    required this.title,
    required this.onPlay,
    required this.isPlaying, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A44), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isPlaying ? AppGradientColors.linear_button: null,
              color: isPlaying ? null : Colors.white,
            ),
            child: 
              AnimatedScale(
                scale: isPlaying ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.graphic_eq_rounded,
                    color: isPlaying?Colors.white : FontColors.button_color,
                    size: 28.sp,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Title
              Expanded(
                child: Text(
                  title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Play button
            GestureDetector(
              onTap: onPlay,
              child: Container(
                width: 32,
                height: 32,
              decoration:BoxDecoration(
                color:isPlaying?Color(0xFFFFFFFF):FontColors.button_color,
                shape: BoxShape.circle,
                border: Border.all(
                  color:FontColors.button_color
                )
              ),
              child:Icon(
                isPlaying ? Icons.pause : Icons.play_arrow, // ✅ dynamic icon
                color: isPlaying? FontColors.button_color:Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//AudioCard(
//   title: "Chat with Dad: A Journey Through Memories",
//   onPlay: () {
//     // Handle play action
//   },
// )
