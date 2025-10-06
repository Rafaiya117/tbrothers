import 'dart:ui';

import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_card_widget.dart';
import 'package:appsoleum/core/components/custom_input_field.dart';
import 'package:appsoleum/core/components/prograssbar_indigator.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  final String accountType;
  const LoginView({super.key, required this.accountType});

  @override
  Widget build(BuildContext context) {
    int _currentPage = 2;
    int _totalPages = 7;
    return Scaffold(
      backgroundColor:FontColors.background_color,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
              child: Container(
                // ignore: deprecated_member_use
                color: FontColors.background_color.withOpacity(0.5),
              ),
            ),
          ),

          //arrow_back and prograssbar
          Positioned(
            top: 20,
            left: 0,
            right: 0, 
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Back button
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/icons/arrow_back.svg",
                                width: 16,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   SizedBox(width: 20.w,),
                    //Progress Indicator (centered because Row takes full width)
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProgressIndicatorWidget(
                            currentPage: _currentPage,
                            totalPages: _totalPages,
                            barHeight: 8.0.h,
                            progressGradient: AppGradientColors.linear_button,
                            //backgroundColor: Colors.grey[300]!,
                          ),
                        ],
                      ),
                    ),
                    // Placeholder (keeps layout balanced since back button is on left)
                    SizedBox(width: 42),
                  ],
                ),
              ),
            ),
          ),

          // Foreground content at bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35,), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCardContainer(
                    child: Column(
                      children: [
                        Text(
                          "Log In",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontWeight:FontWeight.w600,
                            fontSize: 24.sp,
                            color: FontColors.primary_color,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Add details to personalize your acoount",
                          textAlign: TextAlign.center,
                          style:GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: FontColors.secondary_color,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        CustomTextField(
                          label: "Name",
                          controller: TextEditingController(),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextField(
                          label: "Password",
                          controller: TextEditingController(),
                          isPassword: true,
                          height: 50,
                          width: 350,
                          borderRadius: 16,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){
                              context.push('/forgot_password_page');
                            }, 
                            child: Text(
                              "Forgot Password",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomRoundedButton(
                          text: "Log in",
                          backgroundColor: FontColors.button_color,
                            textColor: Colors.white,                           
                            onPressed: () {
                            if (accountType == "legacy") {
                              //context.push('/legecy_screen');
                              context.push('/legecy_home');
                            } else if (accountType == "creator") {
                              context.push('/creator_screen');
                            } else if (accountType == "beneficiary") {
                              context.push('/home_page');
                            }
                          },
                        ),
                          SizedBox(height:10.h),
                          Text(
                            "or Continue with",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SvgPicture.asset(
                            'assets/icons/gmail_icon.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(height:20.h),
                          Align(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: FontColors.button_color,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //print("Sign Up clicked");
                                    context.push('/sigup_page');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}