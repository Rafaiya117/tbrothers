import 'package:appsoleum/core/components/custom_auth_button.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FontColors.background_color,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Center(
              child: SizedBox(
                width: 390.w,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 372.h,
            left: 80.w,
            right: 30.w,
            child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(
            top: 510.h,
            left: 40.w,
            right: 40.w,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24.sp,
                  color: Color(0xFFFFFFFF),
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(text: 'Preserve the Moments\n '),
                  TextSpan(
                    text: 'that Matter',
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 590.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_record.svg',
                      width: 20.sp,
                      height: 20.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        'Images,videos,and voice—timed perfectly.',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          height: 1.5.h,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_shield.svg',
                      width: 20.sp,
                      height: 20.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Create, share, and monetize live moments.',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          height: 2.h,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_realeses.svg',
                      width: 20.sp,
                      height: 20.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Your wisdom. Your story. Your legacy.',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          height: 2.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 750,
            left: 20.w,
            right: 20.w,
            child: Row(
              children: [
                CustomElevatedButton(
                  text: 'Create account',
                  onPressed: () {
                     context.push('/create_account_page');
                  },
                  textColor: Colors.white,
                  buttonColorStart: Color(0xFFFEB253),
                  buttonColorEnd: Color(0xFFFF8B43),
                  height: 48.0.h,
                  width: 169.0.w,
                  borderRadius: 16.0.r,
                  hasBorder: false,
                  borderColor: Colors.transparent,
                ),

                SizedBox(width: 10.w),

                CustomElevatedButton(
                  text: 'Login',
                  onPressed: () {
                   context.push('/create_account_page');
                  },
                  textColor: Color(0xFFFF8B43),
                  buttonColorStart: Color(0xFF00355E),
                  buttonColorEnd: Color(0xFF00355E),
                  height: 48.0.h,
                  width: 169.0.w,
                  borderRadius: 16.0.r,
                  hasBorder: true,
                  borderColor: Color(0xFFFF8B43),
                ),
              ],
            ),
          ),
          Positioned(
            top: 770.h,
            left: 20.w,
            right: 20.w,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: FontColors.disable_text,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: 'By continuing you agree to appsoleum '),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        color: FontColors.disable_text,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' of\n '),
                    TextSpan(
                      text: 'Service',
                      style: TextStyle(
                        color: FontColors.disable_text,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' & '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: FontColors.disable_text,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
