import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/auths/capture_image/controller/capture_controller.dart';
import 'package:appsoleum/features/auths/capture_image/custom_widget/media_seletor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CaptureImage extends StatelessWidget {
  const CaptureImage({super.key});

  @override
  Widget build(BuildContext context) {
    final CaptureController _controller = CaptureController();
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          //height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 16.w,
                      height: 10.h,
                    ),
                    SizedBox(width:100.w),
                    Align(
                      alignment: Alignment.center,
                        child: Text(
                          "Capture Memory",
                        style: GoogleFonts.inter(
                          color: FontColors.text_colors,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),   
                  ],
                ),
                SizedBox(height: 20.h),
                MediaToggle(
                  controller: _controller,
                  onSelectionChanged: (value) {
                    print('Selected: $value');
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }