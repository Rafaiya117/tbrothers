import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:appsoleum/features/create_capsule/custom_widget/dotted_image_uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCapsuleView extends StatelessWidget {
  const CreateCapsuleView({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = CapsuleController();
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
                          "Cerate Capsule",
                        style: GoogleFonts.inter(
                          color: FontColors.text_colors,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add Media",
                  style: GoogleFonts.inter(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                  ),
                ),
              ), 
              Align(
                alignment: Alignment.centerLeft,
                  child: Text(
                    "Your legacy is growung",
                      style: GoogleFonts.inter(
                      color: FontColors.disable_text,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp
                  ),
                ),
              ), 
              CustomImageUploader(
                imageFile: controller.image,
                onAddMedia: controller.pickImage,
                onRemoveMedia: controller.removeImage,
              ),          
            ],
          ),
        ),
      ),
    );
  }
}