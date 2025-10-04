import 'package:appsoleum/core/components/custom_auth_button.dart';
import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/media_preview/widget/media_previw_widget.dart';
import 'package:appsoleum/features/media_preview/widget/show_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CapsuleMemoryPreview extends StatelessWidget {
  const CapsuleMemoryPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color,
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  "assets/icons/arrow_back.svg",
                  width: 16.w,
                  height: 10.h,
                ),
              ),
              SizedBox(height: 20.h),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "Your Memory Capsule\n",
                      style: const TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    TextSpan(
                      text: "Take a last look before sealing your capsule",
                      style: GoogleFonts.playfairDisplay(
                        color: Color(0xFF84869F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:50.h),
              // MediaCards(
              //   type: MediaType.video,
              //   title: "Making memories with my kids!",
              //   subtitle:"Crafting lasting memories with my kids is one of the most rewarding experiences.",
              //   scheduledDate: "June 14, 2034",
              //   mediaPath: "assets/images/family.png",
              //   duration: "5 Minutes",
              //   onTap: () {
              //     // handle play or open
              //   },
              // ),
              MemoryCard(
                mediaType: MediaType.videos,
                date: 'June 14, 2034',
                title: 'Making memories with my kids!',
                description:'Crafting lasting memories with my kids is one of the most rewarding experiences.',
                mediaAsset:'https://ix-marketing.imgix.net/autotagging.png?auto=format,compress&w=1946',
                duration: '5',
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomElevatedButton(
                    icon: 'assets/icons/edit_icon.svg',
                    text: 'Edit Content',
                     onPressed: () {
                      context.push('/create_account_page');
                    },
                    textColor: Color(0xFFFE8641),
                    buttonColorStart: Color(0xFF191D3F),
                    buttonColorEnd: Color(0xFF191D3F),
                    height: 48.0.h,
                    width: 169.0.w,
                    borderRadius: 16.0.r,
                    hasBorder: false,
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                  CustomElevatedButton(
                    icon: 'assets/icons/resize_icon.svg',
                    text: 'Resizable',
                    onPressed: () {
                      context.push('/login_page');
                    },
                    textColor: Color(0xFFFE8641),
                    buttonColorStart: Color(0xFF191D3F),
                    buttonColorEnd: Color(0xFF191D3F),
                    height: 48.0.h,
                    width: 169.0.w,
                    borderRadius: 16.0.r,
                    hasBorder: false,
                    borderColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              CustomRoundedButton(
                text: "Send to Capsule",
                backgroundColor: FontColors.button_color,
                textColor: Colors.white,                           
                onPressed: () {
                  showSuccessDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}