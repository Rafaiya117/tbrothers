import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum MediaType {photos,videos,audio,notes,}
class MemoryCard extends StatelessWidget {
  final MediaType mediaType;
  final String date;
  final String title;
  final String description;
  final String? mediaAsset; 
  final String? duration; 

  const MemoryCard({
    Key? key,
    required this.mediaType,
    required this.date,
    required this.title,
    required this.description,
    this.mediaAsset,
    this.duration,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0081E2),
        borderRadius: BorderRadius.circular(16),
        boxShadow:[
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0,4),
          ),
        ],
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Schedule on $date',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Color(0xFFFFFFFF),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          IntrinsicHeight(
            child:Stack(
              children: [
                _buildMainContent(),
                _buildMediaTypeBadge(),
                if (mediaType == MediaType.videos || mediaType == MediaType.audio)
                _buildDurationButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMainContent() {
    return Container(
      width:double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF191D3F),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          bottom: BorderSide(
          color: Colors.white, 
          width: 0.2,       
        ),
        left: BorderSide(
          color: Colors.white,
          width: 0.2,
        ),
        right: BorderSide(
          color: Colors.white,
          width: 0.2,
        ),
      ),
    ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:mediaType == MediaType.photos || mediaType == MediaType.videos
                  ?Image.network(
                    mediaAsset!,
                    fit: BoxFit.cover,
                    width: 318.w,
                    height: 234.h,
                  ):mediaType == MediaType.audio?Container(
                    color: const Color(0xFF1A23),
                      child: Center(
                      child:Icon(
                        Icons.show_chart,
                        size: 100,
                          // ignore: deprecated_member_use
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                  ):Container(
                    color: const Color(0xFF1A2346),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '“$description”',
                      style: GoogleFonts.inter(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,top: 2),
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,top: 2),
                    child: Text(
                      description,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMediaTypeBadge() {
    IconData icon;
    String text;
    switch (mediaType) {
      case MediaType.photos:
        icon = Icons.photo;
        text = 'Photos';
      break;
      case MediaType.videos:
        icon = Icons.videocam;
        text = 'Videos';
      break;
      case MediaType.audio:
        icon = Icons.mic_rounded;
        text = 'Voice';
      break;
      case MediaType.notes:
        icon = Icons.notes_rounded;
        text = 'Notes';
      break;
    }
    return Positioned(
      top: 50,
      right: 30,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        ),
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 5),
          Text(text, style: GoogleFonts.inter(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
  Widget _buildDurationButton() {
    return Positioned(
      bottom: 100,
      left: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.play_circle_fill, color: Colors.white, size: 14),
            const SizedBox(width: 5),
            Text(
              '$duration Minutes',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
} 


