import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/profile/controller/profile_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountInformationView extends StatelessWidget {
  const AccountInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileSettingsMenuController>();
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
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:SvgPicture.asset(
                        'assets/icons/arrow_back.svg',
                        width: 16.w,
                        height: 10.h,
                      ),
                    ),
                    SizedBox(width: 90.w),
                    Align(
                      alignment: Alignment.center,
                        child: Text(
                          "Account Information",
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
                Container(
                  width:335.w,
                  height: 278.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // ignore: deprecated_member_use
                    color: Color(0xFFFFFFFF),
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/user_image.png',
                          width: 70.w,
                          height: 70.h,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Nicholas Smith",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                          SizedBox(width: 50.w,),
                          Container(
                            width: 41.w,
                            height: 19.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "Edit",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: Color(0xFFFFFFFF)
                                ),
                              ),
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
        ),
      ),
      bottomNavigationBar:CustomBottomNavBar(
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.onNavItemTapped(index),
      ),
    );
  }
}