import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/profile/controller/profile_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
              Expanded(
                child: Container(
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
                            SizedBox(width: 50.w),
                           GestureDetector(
                              onTap: () {
                                context.push('/edit_account_info');
                              },
                              child: Container(
                                width: 41.w,
                                height: 19.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
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
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                            text: 'nicolassmith1234@gmail.com',
                          ),
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
                                readOnly: true,
                                controller: TextEditingController(
                                  text: 'Mar 11,1193',
                                ),
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
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 150.w,
                              child: TextField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: 'Colorado',
                                ),
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Flexible(
                child: Container(
                  width: 335.w,
                  height: 103.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/icon_key.svg',
                              width: 14.w,
                              height: 18.h,
                            ),
                            SizedBox(width: 20.w,),
                            Text(
                              "Change Password",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Color(0xFF1B1B1B),
                              ),
                            ),
                          ],
                        ),
                        //SizedBox(height: 10.h,),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 25.w, vertical: 2.h),
                          child: TextButton(
                            onPressed: (){
                              context.push('/edit_password');
                            }, 
                            child: Container(
                              width: 144.w,
                              height: 37.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF404040),
                              ),
                              child: Center(
                                child: Text(
                                  "Change Password",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),  
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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