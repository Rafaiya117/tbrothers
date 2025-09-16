import 'package:appsoleum/features/gallary_and_timeline/commons/model/time_line_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineCard extends StatelessWidget {
  final TimelineEntry entry;
  final bool isFirst;
  final bool isLast;

  const TimelineCard({
    Key? key,
    required this.entry,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lineColor = Color(0xFF3A3A55);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline line and dot
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: SizedBox(
            height: 152.h + 24, 
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(child: Container(width: 10, color: lineColor)),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(child: Container(width: 10, color: lineColor)),
              ],
            ),
          ),
        ),
        // Card Content
        Expanded(
          child: Container(
            //width: 132.w,
            height: 152.h,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            entry.imageUrl,
                            height: 108.h,
                            width: 112.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          entry.date,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        children: [
                          // Title
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              entry.title,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Media Type Icon
                          Row(
                            children: [
                              Icon(
                                entry.mediaType == MediaType.photo
                                  ? Icons.photo
                                  : Icons.videocam,
                                color: Colors.white54,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                entry.mediaType == MediaType.photo
                                  ? "Photos"
                                  : "Videos",
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

