import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/profile/controller/profile_settings_controller.dart';
import 'package:appsoleum/features/profile/widget/settings_option_widgte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileSettingsMenu extends StatelessWidget {
  const ProfileSettingsMenu({super.key});

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
                    SizedBox(width: 130.w),
                    Align(
                      alignment: Alignment.center,
                        child: Text(
                          "Settings",
                        style: GoogleFonts.inter(
                          color: FontColors.text_colors,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Column(
                  children: [
                  SettingsOption(
                    title: "Account Information",
                    onTap: () {
                      context.push('/account_info_view');
                    },
                  ),
                  SizedBox(height: 10.h),
                  SettingsOption(
                    title: "Subscription",
                    onTap: () {
                      context.push('/subscription_plan');
                    },
                  ),
                  SizedBox(height: 10.h,),
                  SettingsOption(
                    title: "Privacy and Policy",
                    onTap: () {
                      context.push('/privacy_policy');
                    },
                  ),
                  SizedBox(height: 10.h),
                  SettingsOption(
                    title: "Terms and Conditions",
                    onTap: () {
                      context.push('/terms_condition');
                    },
                  ),
                  SizedBox(height: 10.h),
                  SettingsOption(
                    title: "Logout",
                    onTap: () {
                      Navigator.pushNamed(context, "/subscription");
                    },
                  ),
                ],
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