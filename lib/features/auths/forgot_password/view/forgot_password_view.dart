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

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentPage = 3;
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
                          "Forgot Password",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontWeight:FontWeight.w600,
                            fontSize: 24.sp,
                            color: FontColors.primary_color,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Enter you Email address and we will send you a verify code to reset your password",
                          textAlign: TextAlign.center,
                          style:GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: FontColors.secondary_color,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        CustomTextField(
                          label: "Email",
                          controller: TextEditingController(),
                        ),
                        SizedBox(height: 30.h),
                        CustomRoundedButton(
                          text: "Request OTP",
                          backgroundColor: FontColors.button_color,
                            textColor: Colors.white,
                              onPressed: () {
                                context.push('/verify_otp');
                              },
                            ),
                          SizedBox(height:10.h),
                          Align(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              text: "Back to ",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Log in",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: FontColors.button_color,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //print("Sign Up clicked");
                                    context.push('/login_page');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 200.h,)
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