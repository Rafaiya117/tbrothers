import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_input_field.dart';
import 'package:appsoleum/core/components/prograssbar_indigator.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCapsuleNoteView extends StatelessWidget {
  const CreateCapsuleNoteView({super.key});

  @override
  Widget build(BuildContext context) {
   int _currentPage = 2;
   int _totalPages = 7;
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(16.0),
        width: double.infinity,
        //height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.h),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                        child:SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                            width: 16.w,
                            height: 10.h,
                          ),
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
                      "Add Note",
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
                        "Write a personal message for your time capsule",
                          style: GoogleFonts.inter(
                          color: FontColors.disable_text,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp
                        ),
                      ),
                    ), 
                  SizedBox(height:20.h),
                  Consumer<CapsuleController>(
                    builder: (context, controller, _) {
                      return Column(
                        children: [
                          CustomTextField(
                            label: "Title",
                            label_text_color: Colors.white,
                            controller: controller.title,
                            input_text_color: Colors.white,
                            isPassword: false,
                            height: 50,
                            width: 390,
                            borderRadius: 16,
                            backgroundColor: Color(0xFF2A2E52),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            label: "Description",
                            label_text_color: Colors.white,
                            controller: controller.discription,
                            input_text_color: Colors.white,
                            isPassword: false,
                            height: 150,
                            width: 390,
                            borderRadius: 16,
                            backgroundColor: Color(0xFF2A2E52),
                          ),
                          SizedBox(height: 5.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Text(
                                "50/150",
                                style: GoogleFonts.inter(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height:200.h),
            SizedBox(
              width: double.infinity,
              child: ProgressIndicatorWidget(
                currentPage: _currentPage,
                totalPages: _totalPages,
                barHeight: 2.0.h,
                progressGradient: AppGradientColors.linear_button,
                //backgroundColor: Colors.grey[300]!,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Step: $_currentPage of $_totalPages",
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14.sp,
                      fontWeight:FontWeight.w400,
                    ),
                  ),
                  SizedBox(width:20.w),
                  Consumer<CapsuleController>(
                    builder: (context, controller, _) {
                      return SizedBox(
                        width: 130.w,
                        height: 48.h,
                        child: CustomRoundedButton(
                          text: "Next",
                          backgroundColor: controller.title.text.isEmpty? FontColors.disabled_buttonColor: FontColors.button_color,
                          textColor:controller.title.text.isEmpty?FontColors.disable_text: Colors.white,
                          onPressed: controller.title.text.isEmpty
                            ? null: () {
                            context.push('/create_capsule_add_date');
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}