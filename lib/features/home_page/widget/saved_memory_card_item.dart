import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemoryCardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String date;

  const MemoryCardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w, 
      decoration: BoxDecoration(
        color: const Color(0xFF2F2F53),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼 Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              //height: 100.h, 
              fit: BoxFit.cover,
            ),
          ),

          // 📄 Text Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 11.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //SizedBox(height: 5.h),
                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12.sp,
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.5),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 10.sp,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
