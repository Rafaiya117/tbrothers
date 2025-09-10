import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Home",
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/notification.svg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}