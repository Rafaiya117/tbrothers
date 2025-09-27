import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/profile/controller/profile_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAccountInfo extends StatelessWidget {
  const EditAccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileSettingsMenuController>();
    return Scaffold(
      body: Container(
      padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppGradientColors.background_color),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 16.w,
                      height: 10.h,
                    ),
                  ),
                  SizedBox(width: 70.w),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Account Information",
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
                  width: 335.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
                        SizedBox(height: 20.h,),
                        TextField(
                          controller: controller.name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_2_rounded, color: Colors.orange),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.black87,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.orange),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.black87,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: TextField(
                                controller: controller.dob,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.orange,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 150.w,
                              child: TextField(
                                controller: controller.place,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_city,
                                    color: Colors.orange,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomRoundedButton(
                text: "Save",
                backgroundColor: FontColors.button_color,
                textColor: Colors.white,
                onPressed: () {
                  //context.push('/home_page');
                },
              ),
              SizedBox(height: 20.h),
              CustomRoundedButton(
                text: "Cancel",
                backgroundColor: FontColors.secondary_color,
                textColor: Colors.white,
                onPressed: () {
                  //context.push('/home_page');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.onNavItemTapped(index),
      ),
    );
  }
}